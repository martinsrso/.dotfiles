local editor = {}
-- local conf = require('modules.editor.config')

editor['rhysd/accelerated-jk'] = {
  opt = true
}

-- editor['norcalli/nvim-colorizer.lua'] = {
--   ft = {'html','css','sass','vim','typescript','typescriptreact'},
--   config = function()
--     require 'colorizer'.setup {
--         '*';
--     }
--   end
-- }

editor['editorconfig/editorconfig-vim'] = {
  ft = { 'go','typescript','javascript','vim','rust','zig','c', 'cpp', 'python', 'md', 'yaml', 'yml', 'tf', 'Dockerfile' },
  event = 'BufReadPre',
}

editor['hrsh7th/vim-eft'] = {
  event = 'BufReadPre',
  opt = true,
  config = function()
    vim.g.eft_ignorecase = true
  end
}

editor['blackCauldron7/surround.nvim'] = {
    event = 'BufReadPre',
    config = function()
        require "surround".setup {}
    end
}

return editor

