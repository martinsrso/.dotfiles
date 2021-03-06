local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
require('keymap.config')

local plug_map = {
    ["n|gb"]             = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>pu"]     = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait();
    ["n|<leader>pi"]     = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait();
    ["n|<leader>pc"]     = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait();
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>lli"]     = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>llo"]     = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>llr"]     = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),

  --[[   buf_keymap(0, 'n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gA', '<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>', keymap_opts)
  ]]

    ["n|gD"]             = map_cmd("<cmd>lua vim.lsp.buf.declaration()<CR>"):with_noremap():with_silent(),
    ["n|gd"]             = map_cmd("<cmd>lua vim.lsp.buf.definition()<CR>"):with_noremap():with_silent(),
    ["n|K"]              = map_cmd("<cmd>lua vim.lsp.buf.hover()<CR>"):with_noremap():with_silent(),
    ["n|gi"]             = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|gS"]             = map_cmd("<cmd>lua vim.lsp.buf.signature_help()<CR>"):with_noremap():with_silent(),
    -- ["n|;wa"]           = map_cmd("<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>"):with_noremap():with_silent(),
    -- ["n|;wr"]            = map_cmd("<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>"):with_noremap():with_silent(),
    -- ["n|;wl"]             = map_cmd("<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"):with_noremap():with_silent(),
    ["n|gtD"]            = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>rn"]     = map_cmd("<cmd>lua vim.lsp.buf.rename()<CR>"):with_noremap():with_silent(),
    ["n|gA"]             = map_cmd("<cmd>lua vim.lsp.buf.code_action()<CR>"):with_noremap():with_silent(),
    ["n|gr"]             = map_cmd("<cmd>lua vim.lsp.buf.references()<CR>"):with_noremap():with_silent(),
    ["n|;e"]             = map_cmd("<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"):with_noremap():with_silent(),
    ["n|[e"]             = map_cmd("<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"):with_noremap():with_silent(),
    ["n|]e"]             = map_cmd("<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"):with_noremap():with_silent(),
    ["n|gll"]             = map_cmd("<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"):with_noremap():with_silent(),

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
    ["n|<Leader>nn"]     = map_cu('Telescope find_files theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>gf"]     = map_cu('Telescope git_files theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>rg"]     = map_cu('Telescope grep_string theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>lr"]     = map_cu('Telescope live_grep theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>fb"]     = map_cu('Telescope file_browser theme=ivy'):with_noremap():with_silent(),
    -- Vim picker
    ["n|<Leader>bb"]     = map_cu('Telescope buffers theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>cm"]     = map_cu('Telescope commands theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>of"]     = map_cu('Telescope oldfiles theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>qf"]     = map_cu('Telescope quickfix theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>ch"]     = map_cu('Telescope command_history theme=ivy'):with_noremap():with_silent(),
    -- Lsp
    ["n|<Leader>ws"]     = map_cu('Telescope lsp_workspace_symbols theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>dd"]     = map_cu('Telescope lsp_document_diagnostics theme=ivy'):with_noremap():with_silent(),
    ["n|<Leader>wd"]     = map_cu('Telescope lsp_workspace_diagnostics theme=ivy'):with_noremap():with_silent(),
    -- Git
    ["n|<Leader>gc"]     = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>gbc"]     = map_cu('Telescope git_bcommits'):with_noremap():with_silent(),

    -- Plugin acceleratedjk
    -- ["n|j"]              = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    -- ["n|k"]              = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin Outline
    ["n|<Leader>v"]      = map_cu('SymbolsOutline'):with_noremap():with_silent(),
    -- Plugin hrsh7th/vim-eft
    ["n|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["x|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["n|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["x|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["o|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["x|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["o|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),

    -- dap
    ["n|<Leader>dct"]    = map_cr("lua require'dap'.continue()"):with_noremap():with_silent(),
    ["n|<Leader>dsv"]    = map_cr("lua require'dap'.step_over()"):with_noremap():with_silent(),
    ["n|<Leader>dsi"]    = map_cr("lua require'dap'.step_into()"):with_noremap():with_silent(),
    ["n|<Leader>dso"]    = map_cr("lua require'dap'.step_out()"):with_noremap():with_silent(),
    ["n|<Leader>dtb"]    = map_cr("lua require'dap'.toggle_breakpoint()"):with_noremap():with_silent(),
    -- dap-ui-var
    ["n|<Leader>duo"]    = map_cr("lua require'dapui'.open()"):with_noremap():with_silent(),
    ["n|<Leader>dsc"]    = map_cmd("<cmd>lua require'dap.ui.variables'.scopes()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dhh"]    = map_cmd("<cmd>lua require'dap.ui.variables'.hover()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dhv"]    = map_cmd("<cmd>lua require'dap.ui.variables'.visual_hover()<CR>"):with_noremap():with_silent(),
    -- dap-ui-widgets
    ["n|<Leader>duh"]    = map_cmd("<cmd>lua require'dap.ui.widgets'.hover()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>duf"]    = map_cmd("<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>"):with_noremap():with_silent(),
    -- dap-dap
    ["n|<Leader>dsbr"]    = map_cmd("<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dsbm"]    = map_cmd("<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dro"]    = map_cmd("<cmd>lua require'dap'.repl.open()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>drl"]    = map_cmd("<cmd>lua require'dap'.repl.run_last()<CR>"):with_noremap():with_silent(),
    -- telescope-dap
    ["n|<Leader>dcc"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.commands{}<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dco"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dlb"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>"):with_noremap():with_silent(),
    ["n|<Leader>dv"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.variables{}<CR>"):with_noremap():with_silent(),
    ["n|<Leader>df"]    = map_cmd("<cmd>lua require'telescope'.extensions.dap.frames{}<CR>"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)

