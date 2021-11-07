local telescope = require 'telescope'
telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    file_ignore_patterns = {"node_modules", "vendor"},
  },
  extensions = {
    -- frecency = { workspaces = { exo = '/home/wil/projects/research/exoplanet' } },
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
    }
    -- fzf = {
    --   fuzzy = true,
    --   override_generic_sorter = true,
    --   override_file_sorter = true,
    --   case_mode = 'smart_case',
    -- },
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      theme = 'dropdown',
      sort_lastused = true,
      previewer = false,
    },
  },
}

-- Extensions
-- telescope.load_extension 'frecency'
-- telescope.load_extension 'fzf'
telescope.load_extension('fzy_native')
