local config = {}

function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      -- modified_icon = '✥',
      separator_style = "thin",
      indicator_icon = '▎',
      buffer_close_icon = '',
      close_icon = '',
      -- mappings = true,
      always_show_bufferline = false,
    }
  }
end

function config.lualine()
  require("lualine").setup {
    options = {
      theme = "solarized",
      section_separators = {" ", " "},
      component_separators = {"", ""},
      icons_enabled = true
    },
    sections = {
      lualine_a = {{"mode", upper = true}},
      lualine_b = {{"branch", icon = ""}},
      lualine_c = {{"filename", file_status = true}},
      lualine_x = {"encoding", "fileformat", "filetype", require'lsp-status'.status},
      lualine_y = {"progress"},
      lualine_z = {"location"}
  -- require'lsp-status'.status,
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {"filename"},
      lualine_x = {"location"},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
end

function config.gitsigns()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end
  require('gitsigns').setup {
    signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
    },
  }
end

function config.github()
  require("github-theme").setup({
    theme_style = "dark",
    -- other config
  })
end

return config

