local completion = {}
local vim = vim
local conf = require('modules.completion.config')

completion["hrsh7th/nvim-cmp"] = {
    event = 'InsertEnter',
    config = conf.comp,
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
    },
}

completion["hrsh7th/cmp-buffer"] = {after = "nvim-cmp"}
completion["hrsh7th/cmp-path"] = {after = "nvim-cmp"}
completion["hrsh7th/cmp-nvim-lua"] = {after = "nvim-cmp"}
completion["hrsh7th/cmp-nvim-lsp"] = {after = "nvim-cmp"}
completion['hrsh7th/cmp-vsnip'] = {after = 'nvim-cmp'}

completion['hrsh7th/vim-vsnip'] = {
    event = 'InsertCharPre',
    config = conf.vim_vsnip,
    requires = {
        {"hrsh7th/vim-vsnip-integ"},
        {"rafamadriz/friendly-snippets"},
    },
    after = "nvim-cmp"
}

completion["jose-elias-alvarez/null-ls.nvim"] = {
  requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
}

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
  requires = {
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp"},
  }
}

return completion

