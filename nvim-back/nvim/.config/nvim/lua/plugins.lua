local packer = nil
local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use {"wbthomason/packer.nvim"}

  -- Impatient
  use {"lewis6991/impatient.nvim"}

  -- Startup
  use { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 10]] }

  -- Git
  use {
    { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      -- config = [[require('config.gitsigns')]],
    },
    -- { 'TimUntersberger/neogit', cmd = 'Neogit', config = [[require('config.neogit')]] },
  }

  -- Tree
  use { 
    'kyazdani42/nvim-tree.lua',
    cmd = {'NvimTreeToggle','NvimTreeOpen'},
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    },
    config = function() require'nvim-tree'.setup() end
    -- config = [[require("config.nvim_tree")]]
  }

  -- use {
  --   'mhinz/vim-startify'
  --   -- cmd = { "SLoad", "SSave" },
  --   -- config = function()
  --     -- vim.g.startify_disable_at_vimenter = true
  --   -- end,
  -- }

  --[[ use { 
    'akinsho/nvim-toggleterm.lua',
    -- config = [[require('config.toggleterm')]]
  -- } ]]

  use { 'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
        require "nvim-autopairs".setup ({
          disable_filetype = { "TelescopePrompt", "NvimTree" }
        })
    end
  }

  use { 
    'b3nj5m1n/kommentary',
    event = 'BufReadPre'
  }

  --[[ use { 
    "simrat39/symbols-outline.nvim",
    event = 'BufReadPre',
    cmd = {"SymbolsOutline"}
  } ]]

  use { 
    'norcalli/nvim-colorizer.lua',
    ft = {'html','css','sass','vim','typescript','typescriptreact', 'lua'},
    -- event = 'BufRead',
    config = function()
      require 'colorizer'.setup {
          '*';
      }
    end,
  }

  use {
    'editorconfig/editorconfig-vim',
    ft = {'java', 'go','typescript','javascript','vim','rust','zig','c', 'cpp', 'python', 'md', 'yaml', 'yml', 'tf', 'Dockerfile' },
    -- event = 'BufReadPre',
  }

  use {
    "tjdevries/express_line.nvim",
    config = function()
      require('el').setup {}
    end,
  }

  --[[ use { 
    'iamcco/markdown-preview.nvim',
    -- config = [[require('config.markdown_preview')]]
    -- ft = 'markdown',
    -- run = [[sh -c 'cd app && yarn install']],
  -- } ]]

  -- hop - motion
  use { "phaazon/hop.nvim" }

  -- find and replace
  use { 'brooth/far.vim',
    event = {'BufRead','BufNewFile'},
    cmd = {'Far','Farp'},
    config = function ()
      vim.g['far#source'] = 'rg'
    end
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim', opt = true},
      {'nvim-lua/plenary.nvim'},
      -- {'mortepau/codicons.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'},
      -- {'nvim-telescope/telescope-dap.nvim'},
    },
    -- config = [[require("config.telescope")]]
  }

  -- tresitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  
    config = [[require('config.treesitter')]],
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
  use {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'}
  use {"JoosepAlviste/nvim-ts-context-commentstring", after = 'nvim-treesitter'}
  use {'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter'}
  use {"windwp/nvim-ts-autotag", after = 'nvim-treesitter'}

  -- Completion
  use 'onsails/lspkind-nvim'
  use {"rafamadriz/friendly-snippets"}
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'L3MON4D3/LuaSnip', 
        config = function()
          require("luasnip").config.set_config {
            history = true,
          }
          require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" } })
        end,
      },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = [[require('config.completion')]],
    event = 'InsertEnter *',
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
    },
    config = [[require('config.lsp_rust')]]
  }

  -- Lang specific
  -- use {'simrat39/rust-tools.nvim'}
  -- use {"mfussenegger/nvim-jdtls"}
  -- use { "mfussenegger/nvim-dap" }
  -- use {
  --   'rcarriga/nvim-dap-ui',
  --   requires = { {'theHamsta/nvim-dap-virtual-text'}, {"mfussenegger/nvim-dap"}},
  --   config = function()
  --     require("dapui").setup()
  --     require("nvim-dap-virtual-text").setup()
  --   end,
  -- }

  use {'tpope/vim-surround'}

  use {
    'tjdevries/gruvbuddy.nvim', 
    requires = {
      {'tjdevries/colorbuddy.vim'},
    }, 
    config = function() 
      require('colorbuddy').colorscheme('gruvbuddy') 
    end,
  }

end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
