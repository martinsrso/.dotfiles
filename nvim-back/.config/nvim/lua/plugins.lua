local packer = nil
local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Impatient
  use "lewis6991/impatient.nvim"

  -- tresitter
  use {
    'nvim-treesitter/nvim-treesitter',
    -- event = 'BufRead',
    -- branch = '0.5-compat',
    run = ':TSUpdate',  
    config = [[require('config.treesitter')]]
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
  use {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'}
  use {"JoosepAlviste/nvim-ts-context-commentstring", after = 'nvim-treesitter'}
  use {'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter'}

  -- lsp
  use 'kosayoda/nvim-lightbulb'
  use {
    'folke/trouble.nvim',
    config = function() 
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
        },
        use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
      }
    end
  }
  use 'ray-x/lsp_signature.nvim'
  use {
    'neovim/nvim-lspconfig',
    requires = {
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {'mfussenegger/nvim-jdtls'},
    },
    config = [[require('config.lsp_java')]]
  }
  use { 
    "jose-elias-alvarez/null-ls.nvim",
    requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
  }

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
    config = [[require("config.telescope")]]
  }

  -- tools
  use { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 10]] }
  use { 
    'kyazdani42/nvim-tree.lua',
    cmd = {'NvimTreeToggle','NvimTreeOpen'},
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    },
    config = [[require("config.nvim_tree")]]
  }
      
  use { 'brooth/far.vim',
    event = {'BufRead','BufNewFile'},
    cmd = {'Far','Farp'},
    config = function ()
      vim.g['far#source'] = 'rg'
    end
  }

  use { 
    'TimUntersberger/neogit',
    config = function ()
                require('neogit').setup({})
              end,
    requires = 'nvim-lua/plenary.nvim',
  }

  use { 'akinsho/nvim-toggleterm.lua',
    config = [[require('config.toggleterm')]],
  }

  use { 'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
        require "nvim-autopairs".setup ({
          disable_filetype = { "TelescopePrompt", "NvimTree" }
        })
    end
  }

  use { 
    'iamcco/markdown-preview.nvim',
    config = [[require('config.markdown_preview')]],
    ft = 'markdown',
    run = [[sh -c 'cd app && yarn install']],
  }

  use { 'b3nj5m1n/kommentary',
  event = 'BufReadPre'
}

use { "simrat39/symbols-outline.nvim",
  event = 'BufReadPre',
  cmd = {"SymbolsOutline"}
}

  -- ui 
  use { 
    'hoob3rt/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', 
      'nvim-lua/lsp-status.nvim',
      'mortepau/codicons.nvim',
    },
    config = [[require('config.lualine')]],
  }

  use { 
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.bufferline')]],
  }

  use { 
    'lewis6991/gitsigns.nvim',
    event = {'BufRead','BufNewFile'},
    requires = {'nvim-lua/plenary.nvim', opt=true},
    config = [[require('config.gitsign')]],
  }

  -- editor
  use { 'rhysd/accelerated-jk',
    opt = true
  }

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
    'hrsh7th/vim-eft',
    event = 'BufReadPre',
    opt = true,
    config = function()
      vim.g.eft_ignorecase = true
    end
  }
      
  use { 'blackCauldron7/surround.nvim',
      event = 'BufReadPre',
      config = function()
          require "surround".setup {}
      end
  }

  use { 'mfussenegger/nvim-jdtls' }
  use { 
    'vim-test/vim-test', 
    run = ":UpdateRemotePlugins",
    config = function()
      vim.cmd([[let test#java#runner = 'gradletest']])
      vim.cmd([[set maxfuncdepth=1000]])
    end
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
