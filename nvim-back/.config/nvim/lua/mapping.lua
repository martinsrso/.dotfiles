local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- greatest remap ever
    -- vnoremap <leader>p "_dP

    -- -- next greatest remap ever : asbjornHaland
    -- nnoremap <leader>y "+y
    -- vnoremap <leader>y "+y
    -- nnoremap <leader>Y gg"+yG

    -- nnoremap <leader>d "_d
    -- vnoremap <leader>d "_d

    ["n|<A-j>"] = map_cmd([[:m .+1<CR>==.]]):with_noremap(),
    ["n|<A-k>"] = map_cmd([[:m .-2<CR>==.]]):with_noremap(),
    ["i|<A-j>"] = map_cmd([[<Esc>:m .+1<CR>==gi.]]):with_noremap(),
    ["i|<A-k>"] = map_cmd([[<Esc>:m .-2<CR>==gi.]]):with_noremap(),
    ["v|<A-j>"] = map_cmd([[:m '>+1<CR>gv=gv.]]):with_noremap(),
    ["v|<A-k>"] = map_cmd([[:m '<-2<CR>gv=gv.]]):with_noremap(),
    ["n|;;"]    = map_cmd([[$a;<esc>]]),
    ["i|;;"]    = map_cmd([[<esc>$a;]]):with_noremap(),

    -- Vim map
    ["n|Y"]          = map_cmd('y$'),
    -- ["n|;;"]          = map_cmd('<ESC>'),
    ["n|;q"]          = map_cmd(':q<CR>'),
    ["n|;w"]          = map_cmd(':wa<CR>'),
    -- ["n|]w"]         = map_cu('WhitespaceNext'):with_noremap(),
    -- ["n|[w"]         = map_cu('WhitespacePrev'):with_noremap(),
    ["n|<Leader>bp"]         = map_cu('bp'):with_noremap(),
    ["n|<Leader>bn"]         = map_cu('bn'):with_noremap(),
    ["n|<Leader>bd"] = map_cu('bd'):with_noremap(),
    -- ["n|<Leader>cn"] = map_cu('COQnow'):with_noremap(),
    -- ["n|<Leader>cw"]  = map_cu([[silent! keeppatterns %substitute/\s\+$//e]]):with_noremap():with_silent(),
    ["n|<C-h>"]      = map_cmd('<C-w>h'):with_noremap(),
    ["n|<C-l>"]      = map_cmd('<C-w>l'):with_noremap(),
    ["n|<C-j>"]      = map_cmd('<C-w>j'):with_noremap(),
    ["n|<C-k>"]      = map_cmd('<C-w>k'):with_noremap(),
    ["n|<A-[>"]      = map_cr('vertical resize -5'):with_silent(),
    ["n|<A-]>"]      = map_cr('vertical resize +5'):with_silent(),
    ["n|<C-q>"]      = map_cmd(':wq<CR>'),
    ["n|<C-s>"]      = map_cmd(':w<CR>'),
    ["n|<Leader>ss"] = map_cu('SessionSave'):with_noremap(),
    ["n|<Leader>sl"] = map_cu('SessionLoad'):with_noremap(),
    -- Insert
    -- ["i|<Leader>"]   = map_cmd(''),
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

bind.nvim_load_mapping(def_map)

