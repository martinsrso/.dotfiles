vim.g.nvim_tree_special_files = { ['README.md'] = 1, ['Makefile']= 1, ['MAKEFILE']= 1 }

vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {'fugitive'},
  buftype = {'terminal'}
}

-- vim.g["nvim_tree_show_icons"] = {
--   git = 1,
--   folders = 1,
--   files = 1,
--   folder_arrows = 0,
-- }
-- 
-- vim.g["nvim_tree_icons"] = {
--     default = "",
--    symlink = "",
--   git = {
--     unstaged = "○",
--     staged = "",
--     unmerged = "⊜",
--     renamed = "⊙",
--     untracked = "⊕",
--     deleted = "⊗",
--     ignored = "⊘"
--   },
--   folder = {
--     arrow_open = "▾",
--     arrow_closed = "▸",
--     default = "▸",
--     open =  "▾",
--     empty = "▸",
--     empty_open = "▾",
--     symlink = "▸",
--     symlink_open = "▾",
--   }
-- }

local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

nvimtree.setup {
    git = {
        enable = false,
        ignore = true,
        timeout = 400,
    },
   open_on_setup = false,
   auto_close = true,
   opens_on_tab = false,
   update_focused_file = {
     enable = true
   },
     view = {
       allow_resize = true,
       side = "right",
       width = 30,
    },
   diagnostics = {
     enable = true,
     icons = {
       warning = "×",
       error = "×",
     }
   },
   filters = {
     custom = { '.git', 'node_modules', '.cache', 'tmp', '.DS_Store'  }
   }
}
