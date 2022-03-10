local present, packer = pcall(require, "core.packer_init")
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

   -- UI tools
   -- TODO: adicionar limite de char pro status
   use {
      "nvim-lualine/lualine.nvim",
       requires = { 'kyazdani42/nvim-web-devicons', opt = true },
       config = function()
         require("plugins.statusline")
       end,
   }

--   use {
--       disable = true,
--      "akinsho/bufferline.nvim",
--      config = function()
--         require "plugins.bufferline"
--      end,
--   }

    use {
        "ishan9299/nvim-solarized-lua",
        config = function()
            vim.cmd([[set background=light]])
            vim.cmd([[colorscheme solarized]])
        end,
    }

    -- use {
    --     "overcache/NeoSolarized",
    --     config = function()
    --         vim.cmd([[set background=light]])
    --         vim.cmd([[colorscheme NeoSolarized]])
    --     end,
    -- }

   use {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
         require "plugins.nvimtree"
      end,
   }

   -- Git
   use {
      "lewis6991/gitsigns.nvim",
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
         require("plugins.gitsigns")
      end,
   }

     use {
         "sindrets/diffview.nvim",
         after = "neogit",
      }

    use { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' } }

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

    -- utils

     use {
         "numToStr/Comment.nvim",
         config = function()
            require("plugins.others").comment()
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
          'VonHeikemen/searchbox.nvim',
          config = function()
              require("plugins.others").searchbox()
          end,
          requires = {
            {'MunifTanjim/nui.nvim'}
          }
        }

     -- move around quickly
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

    use({
        'crispgm/nvim-tabline',
        config = function()
            require('tabline').setup({})
        end,
    })

--   -- TODO: tabout check function
    use {
       "abecodes/tabout.nvim",
       event = "InsertEnter",
       config = function()
             require("plugins.others").taboutp()
         end,
       requires = {'nvim-treesitter'}, -- or require if not used so far
       --requires = {'nvim-treesitter', 'nvim-cmp'}, -- or require if not used so far
       -- after = 'nvim-cmp' -- if a completion plugin is using tabs load it before
        after = 'nvim-autopairs'
    }

--    use { 'tpope/vim-surround' }

    -- use {
    --   "blackCauldron7/surround.nvim",
    --   config = function()
    --     require"surround".setup {mappings_style = "surround"}
    --   end
    -- }

   use {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
         require("plugins.others").colorizer()
      end,
   }

--   use { "simrat39/symbols-outline.nvim", cmd = {"SymbolsOutline"}}
--
--     use {
--        'kdheepak/lazygit.nvim', 
--        cmd = {"LazyGit"},
--        disable = true,
--    }

   use {
     'akinsho/nvim-toggleterm.lua',
     config = function()
         require('plugins.toggleterm')
     end,
   }

     use {
     'editorconfig/editorconfig-vim',
     ft = {'java', 'go','typescript','javascript','vim','rust','zig','c', 'cpp', 'python', 'md', 'yaml', 'yml', 'tf', 'Dockerfile' },

   }
    use { 'brooth/far.vim',
         event = {'BufRead','BufNewFile'},
         cmd = {'Far','Farp'},
         config = function ()
            vim.g['far#source'] = 'rg'
         end
      }

   -- jk for escape
   use {
      "max397574/better-escape.nvim",
      event = "InsertCharPre",
      config = function()
         require("better_escape").setup {
            mapping = { "jk", "jj" },
            clear_empty_lines = true,
            keys = "<Esc>",
         }
      end,
   }

      use {
         'iamcco/markdown-preview.nvim',
         config = function()
             vim.g.mkdp_auto_start = 1
             vim.g.mkdp_echo_preview_url = 1
         end,
         ft = 'markdown',
         run = [[sh -c 'cd app && yarn install']],
      }

     use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
     use {'nvim-telescope/telescope-ui-select.nvim'}
     use {"nvim-telescope/telescope-dap.nvim"}
     use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        wants = {
            "telescope-ui-select.nvim", 
            "telescope-fzf-native.nvim", 
            "telescope-dap.nvim"
        },
        requires = {
              "nvim-lua/plenary.nvim",
        },
        config = function()
           require "plugins.telescope"
        end,
    }


   use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
         require "plugins.treesitter"
      end,
   }

--   use {
--       'lewis6991/spellsitter.nvim',
--       config = function()
--           require('spellsitter').setup()
--            end
--    }

    use {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
        after = {"tabout.nvim"}
    }

    use {
        "hrsh7th/nvim-cmp",
       event = "InsertEnter",
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

--      use {
--         "lukas-reineke/cmp-rg",
--         after = "nvim-cmp",
--      }

     use {
        "ray-x/cmp-treesitter",
        after = "nvim-cmp",
     }

     use {
        "hrsh7th/cmp-path",
        after = "nvim-cmp",
     }

    use {"jose-elias-alvarez/null-ls.nvim"}
    use {"RRethy/vim-illuminate"}
    use {"simrat39/rust-tools.nvim", requires = { {"neovim/nvim-lspconfig"}, {"nvim-lua/plenary.nvim"} } }

    use {
        'saecki/crates.nvim',
        after = "nvim-cmp",
        event = { "BufRead Cargo.toml" },
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('crates').setup()
        end,
}

   use {
      "neovim/nvim-lspconfig",
        after = {"nvim-cmp", "lsp-status.nvim", "cmp-nvim-lsp"},
        -- after = {"lsp-status.nvim"},
        requires = {'nvim-lua/lsp-status.nvim'},
        wants = {"null-ls.nvim", "vim-illuminate", "rust-tools.nvim", "trouble.nvim"},
          config = function()
         require "plugins.lspconfig"
      end,
   }

   use { "mfussenegger/nvim-dap",
       config = function()
           require("plugins.dap")
       end
    }

    use {
        'theHamsta/nvim-dap-virtual-text',
    }

   use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- Lua
    use {
      "folke/trouble.nvim",
      cmd = {'Trouble', 'TroubleToggle'},
      requires = "kyazdani42/nvim-web-devicons",
    }

end)
