local present, telescope = pcall(require, "telescope")
if not present then
   return
end

telescope.setup{
   defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = " λ ",
      prompt_prefix = "",
      selection_caret = "> ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 20,
    },

   --  border = true,
   --  borderchars = {
   --    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
   --    results = { " " },
   --    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
   --    -- prompt = { " ", " ", "─", " ", " ", " ", "─", "─" },
   --    -- results = { "─", " ", " ", " ", "─", "─", " ", " " },
   --    -- preview = { "─", " ", "─", "│", "┬", "─", "─", "╰" },
   --  },
   --    file_sorter = require("telescope.sorters").get_fuzzy_file,
   --    file_ignore_patterns = {},
   --    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
   --    path_display={ "truncate" },
   --    winblend = 0,
   --    -- border = {},
   --    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
   --    color_devicons = true,
   --    use_less = true,
   --    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
   --    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
   --    -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
   --    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
   --    -- -- Developer configurations: Not meant for general override
   --    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
   extensions = {
      fzf = {
         fuzzy = true, -- false will only do exact matching
         override_generic_sorter = false, -- override the generic sorter
         override_file_sorter = true, -- override the file sorter
         case_mode = "smart_case", -- or "ignore_case" or "respect_case"
         -- the default case_mode is "smart_case"
      },
      ["ui-select"] = {
          require("telescope.themes").get_ivy {
            -- even more opts
              sorting_strategy = "ascending",
              layout_strategy = "bottom_pane",
                  previewer = false,
              layout_config = {
                 height = 8,
              },
          }
      },
   },
}

local extensions = { "ui-select", "fzf", "dap" }
-- local extensions = { "themes", "terms", "fzf", "dap", "ui-select" }
-- local packer_repos = [["extensions", "telescope-fzf-native.nvim"]]

for _, ext in ipairs(extensions) do
  telescope.load_extension(ext)
end

