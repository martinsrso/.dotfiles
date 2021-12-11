local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

vim.o.termguicolors = true

vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
vim.g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
vim.g.nvim_tree_special_files = { ['README.md'] = 1, ['Makefile']= 1, ['MAKEFILE']= 1 }
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        'packer',
        'qf'
    }, buftype = {
        'terminal'
    }
}

vim.g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
}

vim.g.nvim_tree_icons = { default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmered = "",
      unstaged = "✗",
      untracked = "-"
   },
}

nvimtree.setup {
   filters = {
      dotfiles = false,
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   auto_close = false,
   open_on_tab = false,
   hijack_cursor = true,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = true,
   },
   view = {
      allow_resize = true,
      side = "right",
      width = 30,
   },
}
