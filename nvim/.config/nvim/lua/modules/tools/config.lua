local config = {}

function config.nvim_tree()
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  
    -- On Ready Event for Lazy Loading work
    require("nvim-tree.events").on_nvim_tree_ready(
      function()
        vim.cmd("NvimTreeRefresh")
      end)
  
      local list = {
        { key = {"<CR>", "l", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") }, { key = {"s"}, cb = tree_cb("split") }, { key = {"i"}, cb = tree_cb("vsplit") }, }
      vim.g.nvim_tree_window_picker_exclude = {
          filetype = {
              'packer',
              'qf'
          }, buftype = {
              'terminal'
          }
      }
      require'nvim-tree'.setup {
        view = {
          side = 'right',
          mappings = {
            list = list,
            custom_only = false,
          },
        },
      }
  
      vim.g.nvim_tree_ignore = {'.git', 'vendor', '.cache'}
      vim.g.nvim_tree_side = 'right'
      vim.g.nvim_tree_hide_dotfiles = 1
      vim.g.nvim_tree_indent_markers = 1
      vim.g.nvim_tree_special_files = { ['README.md'] = 1, ['Makefile']= 1, ['MAKEFILE']= 1 }
  end

function config.toggleterm()
    require('toggleterm').setup{
        direction = 'horizontal',
        start_in_insert = true,
        open_mapping = [[<c-\>]]
    }
end

function config.autopair()
    -- you need setup cmp first put this after cmp.setup()
    require("nvim-autopairs.completion.cmp").setup({
            map_cr = true, --  map <CR> on insert mode
            map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
            auto_select = true, -- automatically select the first item
            insert = false, -- use insert confirm behavior instead of replace
            map_char = { -- modifies the function or method delimiter by filetypes
            all = '(',
            tex = '{'
        }
    })
end

function config.markdown_preview()
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_echo_preview_url = 1
    -- vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

function config.telescope()
    require('telescope').setup {
        defaults = {
            layout_config = {
                horizontal = {prompt_position = "top", results_width = 0.4},
                vertical = {mirror = false}
            },
            sorting_strategy = 'ascending',
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep
                .new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist
                .new
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            }
        }
    }
  require('telescope').load_extension('fzy_native')
end

return config

