vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"java", "go", "hcl", "yaml", "html", "typescript", "tsx", "javascript", "python", "dockerfile", "json5", "bash"},
    ignore_install = { "haskell" },
    highlight = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        -- enable_autocmd = false,
        config = {
            c = "// %s",
            lua = "-- %s",
            terraform = "# %s",
            go = "// %s",
            golang = "// %s",
        },
    },
    textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    },
    refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
    
        smart_rename = {
          enable = false,
          keymaps = {
            -- mapping to rename reference under cursor
            smart_rename = "grr",
          },
        },
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
      
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["aC"] = "@class.outer",
                ["iC"] = "@class.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            },
        },
    },
}