pcall(require, "impatient")

if require("packer_download")() then
    return
end

require "impatient"
-- require "profile"

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n',' ','',{noremap = true})
vim.api.nvim_set_keymap('x',' ','',{noremap = true})
vim.api.nvim_set_keymap('i','hh','<ESC>',{noremap = true})

require("disable_builtin")
require("globals")
require("command")
-- require("event")
-- require('mapping')
-- require('options')
-- require('keymap')

