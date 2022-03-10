vim.g.nvim_tree_special_files = { ['README.md'] = 1, ['Makefile']= 1, ['MAKEFILE']= 1 }

vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_icon_padding = " "

local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

nvimtree.setup {
  diagnostics = {
    enable = false,
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  filters = {
    custom = { '.git', 'node_modules', '.cache', 'tmp', '.DS_Store'  }
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 40,
    side = 'right',
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  },
  log = {
    enable = false,
    types = {
      all = false,
      config = false,
      git = false,
    },
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  }
}
