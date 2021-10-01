local ui = {}
local conf = require('modules.ui.config')

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {
    {'kyazdani42/nvim-web-devicons'},
  }
}

ui['hoob3rt/lualine.nvim'] = {
  config = conf.lualine,
  requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/lsp-status.nvim'}
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

--[[ ui['lukas-reineke/indent-blankline.nvim'] = {
  event = {'BufReadPre'},
  config = conf.indent_blankline
} ]]

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

return ui

