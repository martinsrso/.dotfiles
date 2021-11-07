if require('packer_download')() then
    require('plugins').sync()
    return
end

require "impatient"
-- require "profile"

local cmd = vim.cmd

require('disable_builtin')
require "globals"
require("command")

cmd [[set hidden]]

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n',' ','',{noremap = true})
vim.api.nvim_set_keymap('x',' ','',{noremap = true})
vim.api.nvim_set_keymap('i','jk','<ESC>',{noremap = true})
-- imap <leader>

require('event')
require('mapping')
require('options')
require('keymap')

-- vim.cmd([[let g:solarized_diffmode = 'normal']])
-- vim.cmd('colorscheme NeoSolarized')
-- vim.cmd('let g:neosolarized_italic=1')
vim.cmd('set background=light')
