local completion = {}
-- local vim = vim
local conf = require('modules.completion.config')

completion['ms-jpq/coq_nvim'] = {
    branch = 'coq',
    config = conf.coq,
    run = ':COQdeps',
    requires = {
        {'ms-jpq/coq.artifacts', branch = 'artifacts'},
    }
}

-- completion["hrsh7th/nvim-cmp"] = {
--     event = 'InsertEnter',
--     config = conf.comp,
--     requires = {
--         {"hrsh7th/cmp-nvim-lsp"},
--         -- s{"SirVer/ultisnips"},
--             -- 'quangnguyen30192/cmp-nvim-ultisnips',
--     },
-- }

-- completion["hrsh7th/cmp-path"] = {
--   after = "nvim-cmp",
-- }
-- completion["hrsh7th/cmp-nvim-lua"] = {
--   after = "nvim-cmp",
-- }
-- completion["hrsh7th/cmp-calc"] = {
--   after = "nvim-cmp",
-- }
-- completion["hrsh7th/cmp-buffer"] = {
--   after = "nvim-cmp",
-- }
-- completion["hrsh7th/cmp-emoji"] = {
--   after = "nvim-cmp",
-- }
-- completion["hrsh7th/cmp-vsnip"] = {
--   after = "nvim-cmp",
-- }

-- completion['hrsh7th/vim-vsnip'] = {
--     event = 'InsertCharPre',
--     config = conf.vim_vsnip,
--     requires = {
--         {"hrsh7th/vim-vsnip-integ"},
--         {"rafamadriz/friendly-snippets"},
--     },
--     after = "nvim-cmp"
-- }

completion['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
  requires = {
    {"hrsh7th/nvim-cmp"},
  }
}

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim'},
    {'mortepau/codicons.nvim'},
    {'nvim-telescope/telescope-fzy-native.nvim'},
    {'nvim-telescope/telescope-dap.nvim'},
  }
}

completion['liuchengxu/vista.vim'] = {
  cmd = 'Vista',
  config = conf.vim_vista
}

-- completion['ray-x/go.nvim'] = {
--     ft = {'go'},
--     -- cmd = {'Goimport', 'GoAddAllTest', 'GoAlt'},
--     -- cmd = {'Goimport', 'GoAddAllTest', 'GoAlt'},
--     config = function ()
--         require('go').setup({})
--     end,
--     requires = {
--         {'mfussenegger/nvim-dap'},
--         {'rcarriga/nvim-dap-ui'},
--         {'theHamsta/nvim-dap-virtual-text'},
--     }
-- }

--[[ completion['fatih/vim-go'] = {
    ft = {'go'},
    run = ":GoUpdateBinaries",
    event = 'BufRead',
    config = function ()
        vim.cmd('let g:go_diagnostics_enabled = 0')
        vim.cmd('let g:go_metalinter_enabled = []')
        vim.cmd('let g:go_jump_to_error = 0')
        -- vim.cmd([[let g:go_fmt_command = ""]]
        -- vim.cmd('let g:go_auto_sameids = 0')
        -- vim.cmd('let g:go_code_completion_enabled = 0')
        -- vim.cmd('let g:go_fmt_autosave = 0')
    -- end
-- } ]]

return completion

