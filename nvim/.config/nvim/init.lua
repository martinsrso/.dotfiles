local present, impatient = pcall(require, "impatient")
if present then
   -- NOTE: currently broken, will fix soon
   -- impatient.enable_profile()
end

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "matchparen",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Leader map
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n"," ","",{noremap = true})
vim.api.nvim_set_keymap("x"," ","",{noremap = true})

-- since we lazy load packer.nvim, we need to load it when we run packer-related commands
vim.cmd "silent! command PackerCompile lua require 'core.plugins' require('packer').compile()"
vim.cmd "silent! command PackerInstall lua require 'core.plugins' require('packer').install()"
vim.cmd "silent! command PackerStatus lua require 'core.plugins' require('packer').status()"
vim.cmd "silent! command PackerSync lua require 'core.plugins' require('packer').sync()"
vim.cmd "silent! command PackerUpdate lua require 'core.plugins' require('packer').update()"

-- vim.cmd("highlight SpecialKey ctermfg=blue ctermbg=red guifg=blue guibg=red")

 -- load options, mappings, and plugins
local modules = {
    "keymap",
    "core.options",
    "core.event",
    "core.packer_compiled",
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end

