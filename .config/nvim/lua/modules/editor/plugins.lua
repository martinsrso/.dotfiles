local editor = {}
-- local conf = require('modules.editor.config')

editor['rhysd/accelerated-jk'] = {
  opt = true
}

editor['norcalli/nvim-colorizer.lua'] = {
  ft = {'html','css','sass','vim','typescript','typescriptreact'},
  config = function()
    require 'colorizer'.setup {
        '*';
    }
  end
}

editor['hrsh7th/vim-eft'] = {
  opt = true,
  config = function()
    vim.g.eft_ignorecase = true
  end
}

--[[ editor['kana/vim-operator-replace'] = {
  keys = {{'x','p'}},
  config = function()
    vim.api.nvim_set_keymap("x", "p", "<Plug>(operator-replace)",{silent =true})
  end,
  requires = 'kana/vim-operator-user'
} ]]


editor['blackCauldron7/surround.nvim'] = {
    event = 'BufReadPre',
    config = function()
        require "surround".setup {}
    end
}

return editor

