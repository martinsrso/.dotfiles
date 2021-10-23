local tools = {}
local conf = require('modules.tools.config')

tools['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {
    {'kyazdani42/nvim-web-devicons'},
  }
}

tools['brooth/far.vim'] = {
  event = {'BufRead','BufNewFile'},
  cmd = {'Far','Farp'},
  config = function ()
    vim.g['far#source'] = 'rg'
  end
}

tools['TimUntersberger/neogit'] = {
    config = function ()
                require('neogit').setup({})
             end,
    requires = 'nvim-lua/plenary.nvim',
}

-- tools['akinsho/nvim-toggleterm.lua'] = {
--   config = conf.toggleterm,
-- }

tools['windwp/nvim-autopairs'] = {
  event = 'InsertEnter',
  config = conf.autopair,
  after = 'nvim-cmp'
}

tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown',
  run = [[sh -c 'cd app && yarn install']],
  config = conf.markdown_preview,
}

tools['b3nj5m1n/kommentary'] = {
  event = 'BufReadPre'
}

tools["simrat39/symbols-outline.nvim"] = {
  event = 'BufReadPre',
  cmd = {"SymbolsOutline"}
}

tools['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    -- {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim'},
    -- {'mortepau/codicons.nvim'},
    {'nvim-telescope/telescope-fzy-native.nvim'},
    {'nvim-telescope/telescope-dap.nvim'},
  }
}

-- use 'gpanders/nvim-parinfer' -- testar

return tools

