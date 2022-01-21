local M = {}

M.blankline = function()
     vim.cmd [[highlight IndentBlanklineIndent1 guifg=#eee8d5 gui=nocombine]]
    vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_filetype_exclude = {
    "startify",
    "dashboard",
    "dotooagenda",
    "log",
    "fugitive",
    "gitcommit",
    "packer",
    "vimwiki",
    "markdown",
    "json",
    "txt",
    "vista",
    "help",
    "todoist",
    "NvimTree",
    "peekaboo",
    "git",
    "TelescopePrompt",
    "undotree",
    "flutterToolsOutline",
    "" -- for all buffers without a file type
  }
  vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.char_highlight_list = {
        "IndentBlanklineIndent1",
    }
  -- vim.g.indent_blankline_show_current_context = true
  vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
    local present, indent_blankline = pcall(require, "indent_blankline")
    if present then
        indent_blankline.setup({
            -- char_highlight_list = {
            --     "IndentBlanklineIndent1",
            -- },
        })
    end
end

M.markdown = function()
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_echo_preview_url = 1
end

M.colorizer = function()
    local present, colorizer = pcall(require, "colorizer")
    if present then
       colorizer.setup({ "*" }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          mode = "foreground", -- Set the display mode.
       })
       vim.cmd "ColorizerReloadAllBuffers"
    end
end

M.gitsigns = function()
   local present, gitsigns = pcall(require, "gitsigns")
   if present then
       gitsigns.setup()
   end
end

M.taboutp = function()
   local present, tab = pcall(require, "tabout")
   if present then
    tab.setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
           {open = "'", close = "'"},
           {open = '"', close = '"'},
           {open = '`', close = '`'},
           {open = '(', close = ')'},
           {open = '[', close = ']'},
           {open = '{', close = '}'},
           {open = '#', close = ']'}
        },
        -- ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        -- exclude = {} -- tabout will ignore these filetypes
     }
    end
end

M.autopair = function ()
end

M.signature = function()
    local present, lspsignature = pcall(require, "lsp_signature")
    if present then
       lspsignature.setup {
          bind = true,
          doc_lines = 2,
          floating_window = true,
          fix_pos = true,
          hint_enable = true,
          hint_prefix = " ",
          hint_scheme = "String",
          hi_parameter = "Search",
          max_height = 22,
          max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
          handler_opts = {
             border = "single", -- double, single, shadow, none
          },
          zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
          padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
       }
    end
end

M.luasnip = function()
    local present, luasnip = pcall(require, "luasnip")
    if not present then
       return
    end
 
    luasnip.config.set_config {
       history = true,
       updateevents = "TextChanged,TextChangedI",
       region_check_events = "InsertEnter"
    }
    require("luasnip/loaders/from_vscode").load()
end

M.comment = function()
    local present, comment = pcall(require, "Comment")
    if present then
       comment.setup {
          padding = true,
       }
    end
end

M.searchbox = function()
    local present, searchbox = pcall(require, "searchbox")
    if present then
       searchbox.setup{}
       vim.api.nvim_set_keymap(
          "n",
          "/",
          ':lua require("searchbox").match_all({clear_matches = true})<CR>',
          { noremap = true }
       )
       vim.api.nvim_set_keymap(
          "n",
          "<leader>/",
          ':lua require("searchbox").replace({confirm = "menu"})<CR>',
          { noremap = true }
       )
       vim.api.nvim_set_keymap(
          "v",
          "<leader>/",
          '<Esc><cmd>lua require("searchbox").replace({exact = true, visual_mode = true, confirm = "menu"})<CR>',
          { noremap = true }
       )
    end
 end

return M
