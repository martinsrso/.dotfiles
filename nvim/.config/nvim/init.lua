local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo

-- cmd [[colorscheme github_dimmed]]

-- cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-- -- Commands
-- -- cmd [[command! WhatHighlight :call util#syntax_stack()]]
-- cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
-- cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
-- cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
-- cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
-- cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

require('core')