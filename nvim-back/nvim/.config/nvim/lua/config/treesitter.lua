vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"toml", "java", "go", "hcl", "yaml", "html", "typescript", "tsx", "javascript", "python", "dockerfile", "json5", "bash", "http", "kotlin" },
    ignore_install = { "haskell", "rust" },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            --[[ init_selection = "<C-w>", -- maps in normal mode to init the node/scope selection
            node_incremental = "<C-w>", -- increment to the upper named parent
            node_decremental = "<C-W>", -- decrement to the previous node
            scope_incremental = "<C-e>", -- increment to the upper scope (as defined in locals.scm) ]]
        },
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
            rust = "// %s",
            java = "// %s"
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
