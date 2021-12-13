local present, packer = pcall(require, "packer_init")

if present then
   packer = require "packer"
else
   return false
end

local use = packer.use
return packer.startup(function()
   -- Have packer manage itself
   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   -- Startup optimizations
   use {
      "nathom/filetype.nvim",
   }

   use {
      "lewis6991/impatient.nvim",
   }

   use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
   }

   use {
      "kyazdani42/nvim-web-devicons",
   }

   use {
      "nvim-lualine/lualine.nvim",
       config = function()
         require("plugins.statusline")
       end,
   }

   use {
      "akinsho/bufferline.nvim",
      config = function()
         require "plugins.bufferline"
      end,
   }

   use {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
         require("plugins.others").colorizer()
      end,
   }

   use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
         require "plugins.treesitter"
      end,
   }

   use {
      "nvim-treesitter/playground",
      cmd = "TSPlayground",
      disable = true
   }

   use {
      "p00f/nvim-ts-rainbow",
      after = "nvim-treesitter",
   }

   use {
     'JoosepAlviste/nvim-ts-context-commentstring',
     after = "nvim-treesitter",
  }

   use {
      "lewis6991/gitsigns.nvim",
   }

   use {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function()
         require "plugins.nvimtree"
      end,
   }

   use {
      "neovim/nvim-lspconfig",
      config = function()
         require "plugins.lspconfig"
      end,
   }

   use {
      "williamboman/nvim-lsp-installer",
   }

   use {
      "ray-x/lsp_signature.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("plugins.others").signature()
      end,
   }

   use {
      "rafamadriz/friendly-snippets",
      event = "InsertEnter",
   }

   use {
      "numToStr/Comment.nvim",
      config = function()
         require("plugins.others").comment()
      end,
   }

   use {
      "hrsh7th/nvim-cmp",
      after = "friendly-snippets",
      config = function()
         require "plugins.cmp"
      end,
   }

   use {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("plugins.others").luasnip()
      end,
   }

   use {
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
   }

   use {
      "hrsh7th/cmp-nvim-lua",
      after = "nvim-cmp",
   }

   use {
      "hrsh7th/cmp-nvim-lsp",
      after = "nvim-cmp",
   }

   use {
      "lukas-reineke/cmp-rg",
      after = "nvim-cmp",
   }

   use {
      "ray-x/cmp-treesitter",
      after = "nvim-cmp",
   }

   use {
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
   }

   use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = {
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-lua/plenary.nvim",
            run = "make",
         },
      },
      config = function()
         require "plugins.telescope"
      end,
   }

   use {
      "VonHeikemen/fine-cmdline.nvim",
      requires = {
         "MunifTanjim/nui.nvim",
      },
      config = function()
         require("plugins.others").fineCmdline()
      end,
      disable = true,
   }


   use {
      "Pocco81/TrueZen.nvim",
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "plugins.zenmode"
      end,
      disable = true,
   }

   use {
      "folke/twilight.nvim",
      cmd = {
         "Twilight",
         "TwilightEnable",
      },
      config = function()
         require("twilight").setup {}
      end,
      disable = true,
   }

   use {
      "MunifTanjim/nui.nvim",
   }

   use {
      "VonHeikemen/searchbox.nvim",
      after = "nui.nvim",
      config = function()
         require("plugins.others").searchbox()
      end,
   }

   use {
      "phaazon/hop.nvim",
      cmd = {
         "HopWord",
         "HopLine",
         "HopChar1",
         "HopChar2",
         "HopPattern",
      },
      as = "hop",
      config = function()
         require("hop").setup()
      end,
   }

   use {
      "sindrets/diffview.nvim",
      after = "neogit",
   }

   use {
      "TimUntersberger/neogit",
      cmd = {
         "Neogit",
         "Neogit commit",
      },
      config = function()
         require "plugins.neogit"
      end,
   }

   use { 'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
         require "nvim-autopairs".setup{
            disable_filetype = { "TelescopePrompt", "NvimTree" }
         }
      end
   }

   use {
      'iamcco/markdown-preview.nvim',
      config = [[require('config.markdown_preview')]],
      ft = 'markdown',
      run = [[sh -c 'cd app && yarn install']],
   }

   use { 'brooth/far.vim',
      event = {'BufRead','BufNewFile'},
      cmd = {'Far','Farp'},
      config = function ()
         vim.g['far#source'] = 'rg'
      end
   }

   -- Lang specific
   use {'simrat39/rust-tools.nvim'}
   use {"mfussenegger/nvim-jdtls"}
   use { "mfussenegger/nvim-dap" }
   use {
      'rcarriga/nvim-dap-ui',
      requires = { {'theHamsta/nvim-dap-virtual-text'}, {"mfussenegger/nvim-dap"}},
      config = function()
         -- require("dap").setup()
         -- require("dapui").setup()
         -- require("nvim-dap-virtual-text").setup()
      end,
   }

   use { 'tpope/vim-surround' }
   use { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true }
   use { 'mhinz/vim-startify' }
   use { 'vim-test/vim-test' }

   use {
      "overcache/NeoSolarized",
      config = function()
         vim.o.termguicolors = true
         vim.cmd([[set background=light]])
         vim.cmd([[colorscheme NeoSolarized]])
      end,
   }

end)
