local config = {}

function config.nvim_lsp()
    require('modules.completion.lspconfig')
end

function config.coq()
    local vim = vim
    vim.g.coq_settings = {
        ["auto_start"] = 'shut-up',
        keymap = { 
            recommended = false,
            pre_select = true,
            jump_to_mark = "<Tab>"
        }
    }
end

-- function config.vim_vsnip()
--   vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
-- end


-- function config.comp()
--     local cmp = require("cmp")
--     -- local types = require('cmp.types')
--     --
--     local check_back_space = function()
--         local col = vim.fn.col '.' - 1
--         return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
--     end

--     cmp.setup{
--         snippet = {
--             expand = function(args)
--                 vim.fn["vsnip#anonymous"](args.body)
--             end
--         },
--         -- completion = {
--         --     keyword_length = 3,
--         -- },
--         mapping = {
--             ['<C-p>'] = cmp.mapping.select_prev_item(),
--             ['<C-n>'] = cmp.mapping.select_next_item(),
--             --[[ ['<TAB>'] = cmp.mapping.select_next_item(),
--             ['<S-TAB>'] = cmp.mapping.select_prev_item(), ]]
--             ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--             ['<C-f>'] = cmp.mapping.scroll_docs(4),
--             ['<C-Space>'] = cmp.mapping.complete(),
--             ['<C-e>'] = cmp.mapping.close(),
--             ['<CR>'] = cmp.mapping.confirm({
--                 behavior = cmp.ConfirmBehavior.Insert,
--                 select = true,
--             }),
--             -- cmp.setup {
--             --     mapping = {
--             --       ['<Tab>'] = function(fallback)
--             --         if cmp.visible() then
--             --           cmp.select_next_item()
--             --         else
--             --           fallback()
--             --         end
--             --       end
--             --     }
--             --   }
--             ['<Tab>'] = cmp.mapping(function(fallback)
--                 if vim.fn.pumvisible() == 1 then
--                     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
--                 elseif vim.fn["vsnip#available"](1) == 1 then
--                     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
--                 elseif check_back_space() then
--                     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
--                 else
--                     fallback()
--                 end
--             end, {
--                 "i",
--                 "s",
--             }),
--         },
--         sources = {
--             {name = 'nvim_lsp'},
--             {name = "nvim_lua"},
--             {name = 'vsnip'},
--             {name = 'buffer'},
--             {name = "path"},
--             {name = "calc"},
--             {name = "emoji"}
--         },
--     }
-- end

function config.telescope()
    local icons = require "codicons"

    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
        vim.cmd [[packadd popup.nvim]]
        vim.cmd [[packadd telescope-fzy-native.nvim]]
    end

    require('telescope').setup {
    defaults = {
            prompt_prefix = " ",
            -- prompt_prefix = icons.get('telescope') .. " ",
            -- prompt_position = 'top',
            selection_caret = " ",
            -- selection_caret = icons.get("arrow-right") .. " ",
            sorting_strategy = 'ascending',
            --[[ results_width = 0.6,
            preview_width = 0.6, ]]
            -- prompt_position = 'top',
            layout_strategy = 'horizontal',
            file_ignore_patterns = {"node_modules, vendors"},
            layout_config = {
                    mirror = false,
                    horizontal = {
                    preview_cutoff = 120,
                    prompt_position = "top"
                },
            },
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
            },
            extensions = {
                fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                }
            }
        }
        require('telescope').load_extension('fzy_native')
        require('telescope').load_extension('dap')
    --  require'telescope'.load_extension('dotfiles')
    --  require'telescope'.load_extension('gosource')
end

function config.vim_vista()
    vim.g['vista#renderer#enable_icon'] = 1
    vim.g.vista_disable_statusline = 1
    vim.g.vista_default_executive = 'ctags'
    vim.g.vista_echo_cursor_strategy = 'floating_win'
    vim.g.vista_vimwiki_executive = 'markdown'
    vim.g.vista_executive_for = {
        vimwiki =  'markdown',
        pandoc = 'markdown',
        markdown = 'toc',
        typescript = 'nvim_lsp',
        typescriptreact =  'nvim_lsp',
        python = 'nvim_lsp',
        clangd = 'nvim_lsp',
        terraform = 'nvim_lsp',
        docker = 'nvim_lsp',
        go = 'nvim_lsp',
        javascript = 'nvim_lsp',
    }
end

return config

