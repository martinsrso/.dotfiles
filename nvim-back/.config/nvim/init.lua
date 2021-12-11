if require('packer_download')() then
    require('plugins').sync()
    return
end

require "impatient"
-- require "profile"

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n',' ','',{noremap = true})
vim.api.nvim_set_keymap('x',' ','',{noremap = true})
vim.api.nvim_set_keymap('i','nn','<ESC>',{noremap = true})

vim.cmd([[let g:solarized_diffmode = 'normal']])
vim.cmd('set background=light')
vim.cmd('let g:neosolarized_italic=1')
vim.cmd('colorscheme NeoSolarized')

require('disable_builtin')
require "globals"
require("command")
require('event')
require('mapping')
require('options')
require('keymap')

-- vim.cmd [[set hidden]]

