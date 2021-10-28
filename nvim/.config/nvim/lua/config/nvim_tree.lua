local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  
-- On Ready Event for Lazy Loading work
require("nvim-tree.events").on_nvim_tree_ready(
    function()
    vim.cmd("NvimTreeRefresh")
end)

local list = {
    { key = {"<CR>", "l", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") }, 
    { key = {"s"}, cb = tree_cb("split") }, 
    { key = {"i"}, cb = tree_cb("vsplit") }, 
}

vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        'packer',
        'qf'
    }, buftype = {
        'terminal'
    }
}

require'nvim-tree'.setup {
    view = {
        side = 'right',
        mappings = {
        list = list,
        custom_only = false,
        },
    },
}

vim.g.nvim_tree_ignore = {'.git', 'vendor', '.cache'}
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_special_files = { ['README.md'] = 1, ['Makefile']= 1, ['MAKEFILE']= 1 }