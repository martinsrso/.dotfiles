local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args

-- Alias
vim.cmd "silent! command! WQ wq"
vim.cmd "silent! command! Wq wq"
vim.cmd "silent! command! W w"
vim.cmd "silent! command! Q q"
vim.cmd "silent! command! Qa qa"

local def_map = {
    ["n|<A-j>"] = map_cmd([[:m .+1<CR>==.]]):with_noremap(),
    ["n|<A-k>"] = map_cmd([[:m .-2<CR>==.]]):with_noremap(),
    ["i|<A-j>"] = map_cmd([[<Esc>:m .+1<CR>==gi.]]):with_noremap(),
    ["i|<A-k>"] = map_cmd([[<Esc>:m .-2<CR>==gi.]]):with_noremap(),
    ["v|<A-j>"] = map_cmd([[:m '>+1<CR>gv=gv.]]):with_noremap(),
    ["v|<A-k>"] = map_cmd([[:m '<-2<CR>gv=gv.]]):with_noremap(),
    ["n|;;"]    = map_cmd([[$a;<esc>]]),
    ["i|;;"]    = map_cmd([[<esc>$a;]]):with_noremap(),
    ["i|-s"]    = map_cmd([[{}]]):with_noremap(),
    ["i|-?"]    = map_cmd([[{:?}]]):with_noremap(),

    -- Vim map
    ["n|<Leader><Leader>c"] = map_cmd([[:noh<CR>]]):with_noremap(),
    ["n|<Leader>q"]  = map_cmd(':%bd|e#|bd#<CR>'),
    ["n|;q"]         = map_cmd(':q<CR>'),
    ["n|;w"]         = map_cmd(':w<CR>'),
    ["n|<Leader>bp"] = map_cu('bp'):with_noremap(),
    ["n|<Leader>bn"] = map_cu('bn'):with_noremap(),
    ["n|<Leader>bd"] = map_cu('bd'):with_noremap(),
    ["n|<C-h>"]      = map_cmd('<C-w>h'):with_noremap(),
    ["n|<C-l>"]      = map_cmd('<C-w>l'):with_noremap(),
    ["n|<C-j>"]      = map_cmd('<C-w>j'):with_noremap(),
    ["n|<C-k>"]      = map_cmd('<C-w>k'):with_noremap(),
    ["n|<A-[>"]      = map_cmd('vertical resize -5'):with_silent(),
    ["n|<A-]>"]      = map_cmd('vertical resize +5'):with_silent(),
    ["n|<A-{>"]      = map_cmd('horizontal resize -5'):with_silent(),
    ["n|<A-}>"]      = map_cmd('horizontal resize +5'):with_silent(),
    ["n|<C-q>"]      = map_cmd(':wq<CR>'),
    ["n|<C-s>"]      = map_cmd(':w<CR>'),
    -- Insert
    ["i|<C-w>"]      = map_cmd('<C-[>diwa'):with_noremap(),
    ["i|<C-h>"]      = map_cmd('<BS>'):with_noremap(),
    ["i|<C-d>"]      = map_cmd('<Del>'):with_noremap(),
    ["i|<C-u>"]      = map_cmd('<C-G>u<C-U>'):with_noremap(),
    ["i|<C-b>"]      = map_cmd('<Left>'):with_noremap(),
    ["i|<C-f>"]      = map_cmd('<Right>'):with_noremap(),
    ["i|<C-a>"]      = map_cmd('<ESC>^i'):with_noremap(),
    ["i|<C-j>"]      = map_cmd('<Esc>o'):with_noremap(),
    ["i|<C-k>"]      = map_cmd('<Esc>O'):with_noremap(),
    ["i|<C-s>"]      = map_cmd('<Esc>:w<CR>'),
    ["i|<C-q>"]      = map_cmd('<Esc>:wq<CR>'),
    ["i|<C-e>"]      = map_cmd([[pumvisible() ? "\<C-e>" : "\<End>"]]):with_noremap():with_expr(),
    -- command line
    ["c|<C-b>"]      = map_cmd('<Left>'):with_noremap(),
    ["c|<C-f>"]      = map_cmd('<Right>'):with_noremap(),
    ["c|<C-a>"]      = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"]      = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"]      = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"]      = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"]      = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
}

local plug_map = {
    -- Packer
    ["n|<leader>pu"]     = map_cr("PackerSync"):with_silent():with_noremap():with_nowait();
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>lli"]     = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>llo"]     = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>llr"]     = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),

    ["n|<Leader>ha"]      = map_cmd([[<cmd>lua require("harpoon.mark").add_file()<CR>]]):with_noremap():with_silent(),
    ["n|<Leader>ht"]      = map_cr("ToggleTerm"):with_noremap():with_silent(),
    ["n|<Leader>hd"]      = map_cr([[TermExec cmd="cargo run"]]):with_noremap():with_silent(),
    ["n|<Leader>hq"]      = map_cmd([[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]]):with_noremap():with_silent(),
    ["n|<Leader>1"]      = map_cmd([[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]]):with_noremap():with_silent(),
    ["n|<Leader>2"]      = map_cmd([[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]]):with_noremap():with_silent(),
    ["n|<Leader>3"]      = map_cmd([[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]]):with_noremap():with_silent(),

    ["n|gD"]             = map_cmd("<cmd>lua vim.lsp.buf.declaration()<CR>"):with_noremap():with_silent(),
    ["n|gd"]             = map_cmd("<cmd>lua vim.lsp.buf.definition()<CR>"):with_noremap():with_silent(),
    ["n|K"]              = map_cmd("<cmd>lua vim.lsp.buf.hover()<CR>"):with_noremap():with_silent(),
    ["n|gi"]             = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|<C-k>"]             = map_cmd("<cmd>lua vim.lsp.buf.signature_help()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>wa"]           = map_cmd("<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>wr"]            = map_cmd("<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>wl"]             = map_cmd("<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"):with_noremap():with_silent(),
    ["n|gtD"]            = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>rn"]     = map_cmd("<cmd>lua vim.lsp.buf.rename()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>ca"]             = map_cmd("<cmd>lua vim.lsp.buf.code_action()<CR>"):with_noremap():with_silent(),
    ["n|gr"]             = map_cmd("<cmd>lua vim.lsp.buf.references()<CR>"):with_noremap():with_silent(),
    ["n|;e"]             = map_cmd("<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>"):with_noremap():with_silent(),
    ["n|[d"]             = map_cmd("<cmd>lua vim.diagnostic.goto_prev()<CR>"):with_noremap():with_silent(),
    ["n|]d"]             = map_cmd("<cmd>lua vim.diagnostic.goto_next()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>q"]             = map_cmd("<cmd>lua vim.diagnostic.set_loclist()<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>f"]             = map_cmd("<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>f"]             = map_cmd("<cmd>lua vim.lsp.buf.formatting_sync()<CR>"):with_noremap():with_silent(),

    -- Plugin nvim-tree
    ["n|<Leader>e"]      = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<Leader>mp"]     = map_cu('MarkdownPreview'):with_noremap():with_silent(),
    -- Plugin DadbodUI
    -- ["n|<Leader>od"]     = map_cr('DBUIToggle'):with_noremap():with_silent(),
    ["n|<Leader>g"]      = map_cu("LazyGit"):with_noremap():with_silent(),
    -- Far.vim
    ["n|<Leader>fz"]     = map_cr('Farf'):with_noremap():with_silent();
    ["v|<Leader>fz"]     = map_cr('Farf'):with_noremap():with_silent();
    -- Plugin Telescope
    -- Files
    ["n|<Leader>nn"]     = map_cu([[Telescope find_files]]):with_noremap():with_silent(),
    ["n|<Leader>tt"]     = map_cu('Telescope git_files'):with_noremap():with_silent(),
    ["n|<Leader>rg"]     = map_cu('Telescope grep_string'):with_noremap():with_silent(),
    ["n|<Leader>rr"]     = map_cu('Telescope live_grep'):with_noremap():with_silent(),
    ["n|<Leader>fb"]     = map_cu('Telescope file_browser'):with_noremap():with_silent(),
    -- Vim picker
    ["n|<Leader>bb"]     = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>cm"]     = map_cu('Telescope commands'):with_noremap():with_silent(),
    ["n|<Leader>of"]     = map_cu('Telescope oldfiles'):with_noremap():with_silent(),
    ["n|<Leader>qf"]     = map_cu('Telescope quickfix'):with_noremap():with_silent(),
    ["n|<Leader>ch"]     = map_cu('Telescope command_history'):with_noremap():with_silent(),
    -- Lsp
    ["n|<Leader>ws"]     = map_cu('Telescope lsp_workspace_symbols'):with_noremap():with_silent(),
    ["n|<Leader>dd"]     = map_cu('Telescope lsp_document_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>wd"]     = map_cu('Telescope lsp_workspace_diagnostics'):with_noremap():with_silent(),
    -- Git
    ["n|<Leader>gc"]     = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>gbc"]     = map_cu('Telescope git_bcommits'):with_noremap():with_silent(),

    -- Plugin acceleratedjk
    -- ["n|j"]              = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    -- ["n|k"]              = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin Outline
    ["n|<Leader>so"]      = map_cu('SymbolsOutline'):with_noremap():with_silent(),
    -- Plugin hrsh7th/vim-eft
    -- ["n|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    -- ["n|,"]              = map_cmd("HopWord"):with_expr(),
    -- ["x|,"]              = map_cmd("HopWord"):with_expr(),
    -- ["o|,"]              = map_cmd("HopWord"):with_expr(),
    -- ["x|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    -- ["n|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    -- ["x|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    -- ["o|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    -- ["n|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    -- ["x|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    -- ["o|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),

    -- rust-tools
    ["n|<Leader>ru"]    = map_cr("RustRunnables"):with_noremap():with_silent(),
    ["n|<Leader>uu"]    = map_cr("RustExpandMacro"):with_noremap():with_silent(),
    ["n|<Leader>oc"]    = map_cr("RustOpenCargo"):with_noremap():with_silent(),
    ["n|<Leader>db"]    = map_cr("RustDebuggables"):with_noremap():with_silent(),
    ["n|<Leader>h"]     = map_cr("RustHoverActions"):with_noremap():with_silent(),

    -- dap
    ["n|<Leader>dc"]    = map_cr("lua require'dap'.continue()"):with_noremap():with_silent(),
    ["n|<Leader>dv"]    = map_cr("lua require'dap'.step_over()"):with_noremap():with_silent(),
    ["n|<Leader>di"]    = map_cr("lua require'dap'.step_into()"):with_noremap():with_silent(),
    ["n|<Leader>do"]    = map_cr("lua require'dap'.step_out()"):with_noremap():with_silent(),
    ["n|<Leader>dt"]    = map_cr("lua require'dap'.toggle_breakpoint()"):with_noremap():with_silent(),
    -- dap-ui-var
    ["n|<Leader>dd"]    = map_cr("lua require'dapui'.open()"):with_noremap():with_silent(),
    -- ["n|<Leader>dsc"]    = map_cmd("<cmd>lua require'dap.ui.variables'.scopes()<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>dhh"]    = map_cmd("<cmd>lua require'dap.ui.variables'.hover()<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>dhv"]    = map_cmd("<cmd>lua require'dap.ui.variables'.visual_hover()<CR>"):with_noremap():with_silent(),
    -- dap-ui-widgets
    -- ["n|<Leader>duh"]    = map_cmd("<cmd>lua require'dap.ui.widgets'.hover()<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>duf"]    = map_cmd("<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>"):with_noremap():with_silent(),
    -- dap-dap
    ["n|<Leader>dsbr"]    = map_cmd("<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dsbm"]    = map_cmd("<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dro"]    = map_cmd("<cmd>lua require'dap'.repl.open()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>drl"]    = map_cmd("<cmd>lua require'dap'.repl.run_last()<CR>"):with_noremap():with_silent(),
    -- telescope-dap
    -- ["n|<Leader>dcc"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.commands{}<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>dco"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>dlb"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>dv"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.variables{}<CR>"):with_noremap():with_silent(),
    -- ["n|<Leader>df"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.frames{}<CR>"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
bind.nvim_load_mapping(def_map)
