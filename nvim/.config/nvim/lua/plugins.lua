local function install_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        print(vim.inspect(install_path))
        packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    end
end

local packer = nil
local function init()
  if packer == nil then
    packer = require "packer"
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  use {"wbthomason/packer.nvim"}

  -- -- Color scheme
  -- use {
  --   {"projekt0n/circles.nvim"},
  --   {
  --     "projekt0n/github-nvim-theme",
  --     config = [[require('github-theme').setup()]]
  --   },
  -- }

  -- -- Tools
  -- use {
  --   {"editorconfig/editorconfig-vim"},
  --   {"akinsho/nvim-toggleterm.lua"},
  --   {"windwp/nvim-autopairs"},
  --   {"iamcco/markdown-preview.nvim"},
  --   {"b3nj5m1n/kommentary"},
  --   {"phaazon/hop.nvim"},
  --   {"simrat39/symbols-outline.nvim"},
  --   {"henriquehbr/nvim-startup.lua", config=[[require 'nvim-startup'.setup()]]}
  -- }

  -- -- Status/Buffer line
  -- use {
  --   { 
  --     "hoob3rt/lualine.nvim",
  --   },
  --   {"akinsho/nvim-bufferline.lua"}
  -- }

  -- -- Path navigation
  -- use {
  --   "kyazdani42/nvim-tree.lua",
  --   cmd = {"NvimTreeToggle", "NvimTreeOpen"},
  -- }

  -- -- LSP
  -- use { "jose-elias-alvarez/null-ls.nvim",
  --   requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
  -- }

  -- -- Highlight colors
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   ft = { 'css', 'javascript', 'vim', 'html' },
  --   config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html'}]],
  -- }

  -- -- Refactoring
  -- use { 'ThePrimeagen/refactoring.nvim', opt = true }

  -- -- Completion
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   requires = {
  --     'L3MON4D3/LuaSnip',
  --     { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
  --     'hrsh7th/cmp-nvim-lsp',
  --     { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
  --     { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
  --     { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
  --   },
  --   -- config = [[require('config.cmp')]],
  --   event = 'InsertEnter *',
  -- }

  -- -- Lisps
  -- use 'gpanders/nvim-parinfer'

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    requires = {
      -- {'nvim-treesitter/nvim-treesitter-refactor', branch = '0.5-compat'},
      {'nvim-treesitter/nvim-treesitter-textobjects', branch = '0.5-compat'}
    },
    wants = {
      -- 'nvim-treesitter-refactor',
      'nvim-treesitter-textobjects',
    },
    -- config = [[require('config.treesitter')]],
    run = ':TSUpdate',
    event = 'BufRead',
    after = 'telescope.nvim',
  }

  -- -- Pretty symbols
  -- use 'kyazdani42/nvim-web-devicons'

  -- -- Git
  -- use {
  --   { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
  --   {
  --     'lewis6991/gitsigns.nvim',
  --     requires = { 'nvim-lua/plenary.nvim' },
  --     -- config = [[require('config.gitsigns')]],
  --   },
  --   { 'TimUntersberger/neogit', cmd = 'Neogit'
  --   -- config = [[require('config.neogit')]] 
  --   },
  -- }

  -- Search
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        -- 'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-frecency.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
      },
      wants = {
        -- 'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      -- setup = [[require('config.telescope_setup')]],
      config = [[require('config.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sql.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
    },
  }
end

local plugins = setmetatable({}, {
    __index = function(_, key)
      install_packer()
      init()
      return packer[key]
    end,
})

return plugins
