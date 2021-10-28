require("lualine").setup {
    options = {
        theme = "auto",
        section_separators = {" ", " "},
        component_separators = {"", ""},
        icons_enabled = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{"branch", icon = ""},
                      {'diagnostics', sources={'nvim_lsp', 'coc'}}},
        lualine_c = {'diff', 'filename'},
        -- lualine_c = {'filename', "require'lsp-status'.progress()"},
        lualine_x = {"require'lsp-status'.status()", 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
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
