require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {{
      'mode',
      fmt = function(str)
        return (str:lower():gsub("^%l", string.upper))
      end,
    }},
    lualine_b = {'branch'},
    lualine_c = { {
      'filename',
      file_status = true,
      path = 1,
      shorting_target = 40,
    }},
    lualine_x = {'diagnostics', 'diff', 'filetype'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}