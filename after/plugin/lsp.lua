local lsp = require('lsp-zero').preset({})
local cmp = require("cmp")
local lspconfig = require('lspconfig')

lsp.ensure_installed({
  'clangd',
  'zls',
  'rust_analyzer'
})

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
      else
        fallback()
      end
    end, {"i","s","c",}),
  }

})

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  lsp.default_keymaps({buffer = bufnr})
end

lspconfig.zls.setup { -- Use zig language server
  on_attach = on_attach
}

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
