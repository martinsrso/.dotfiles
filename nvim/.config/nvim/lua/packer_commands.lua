-- since we lazy load packer.nvim, we need to load it when we run packer-related commands
vim.cmd "silent! command PackerCompile lua require 'plugin_list' require('packer').compile()"
vim.cmd "silent! command PackerInstall lua require 'plugin_list' require('packer').install()"
vim.cmd "silent! command PackerStatus lua require 'plugin_list' require('packer').status()"
vim.cmd "silent! command PackerSync lua require 'plugin_list' require('packer').sync()"
vim.cmd "silent! command PackerUpdate lua require 'plugin_list' require('packer').update()"
