local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

--[[ lang['lewis6991/spellsitter.nvim'] = {
    after = 'nvim-treesitter',
    config = function()
        require('spellsitter').setup();
    end
} ]]

return lang

