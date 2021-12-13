local M = {}

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
