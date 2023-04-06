vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.barbar_auto_setup = false -- disable auto-setup
require('barbar').setup {
    -- Enable highlighting visible buffers
    highlight_visible = true,

    sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        NvimTree = {text = 'NvimTree'},
        undotree = {text = 'undotree'},
    }
}
