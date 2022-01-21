local opt = vim.opt

vim.cmd("set termguicolors")
-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*", "**/vendor/**", ".git", "*.jpeg", "*.jpg", "*.png", "*.gif", "*.zip", "*.DS_Store", "**/node_modules/**", "*.out" }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.pumheight = 10
-- opt.wildmode = "longest:full"
-- opt.wildoptions = "pum"
-- opt.colorcolumn = '100'
-- vim.wo.colorcolumn = "100"
vim.wo.signcolumn = "yes"
opt.completeopt = "menu,menuone,noselect"

opt.showmode = false
opt.relativenumber = true -- Show line numbers
opt.showcmd = true
opt.cmdheight = 2 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
-- opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
-- opt.cursorline = true -- Highlight the current line
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Undo history
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true

-- opt.spell = true
opt.ttyfast = true
-- opt.shell = "/bin/bash"

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = "expr"
opt.foldlevel = 99
opt.modelines = 1

opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.swapfile = false -- Living on the edge
opt.shada = { "!", "'1000", "<50", "s10", "h" }
-- opt.updatetime = 100;
-- opt.redrawtime = 1500;

opt.mouse = "n"

opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
opt.list = true

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
-- opt.formatoptions = opt.formatoptions
--   - "a" -- Auto formatting is BAD.
--   - "t" -- Don't auto format my code. I got linters for that.
--   + "c" -- In general, I like it when comments respect textwidth
--   + "q" -- Allow formatting comments w/ gq
--   - "o" -- O and o, don't continue comments
--   + "r" -- But do continue when pressing enter.
--   + "n" -- Indent past the formatlistpat, not underneath it.
--   + "j" -- Auto-remove comments if possible.
--   - "2" -- I'm not in gradeschool anymore

opt.shortmess = opt.shortmess + "c"

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

vim.api.nvim_exec([[
  augroup NoAutoComment
    au!
    au FileType * setlocal formatoptions-=ro
  augroup end
]], false)
vim.cmd([[ au TermOpen * setlocal nospell ]])
