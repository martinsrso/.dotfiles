local global = require('core.global')

local function bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      vim.cmd('set ' .. k)
    else
      vim.cmd('set ' .. k .. '=' .. v)
    end
  end
end

local function load_options()
  local global_local = {
    termguicolors  = true;
    mouse          = "nvi"; 
    errorbells     = true; 
    visualbell     = true;
    hidden         = true;
    fileformats    = "unix,mac,dos";
    virtualedit    = "block";
    viewoptions    = "folds,cursor,curdir";
    clipboard      = "unnamedplus";
    wildignorecase = true;
    wildignore     = "**/vendor/**,.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";
    backup         = false;
    writebackup    = false;
    swapfile       = false;
    directory      = global.cache_dir .. "swag/";
    undodir        = global.cache_dir .. "undo/";
    backupdir      = global.cache_dir .. "backup/";
    viewdir        = global.cache_dir .. "view/";
    spellfile      = global.cache_dir .. "spell/en.uft-8.add";
    history        = 2000;
    shada          = "!,'300,<50,@100,s10,h";
    backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
    shiftround     = true; -- ctrl T or D in insert mode
    updatetime     = 100;
    redrawtime     = 1500;
    ignorecase     = true;
    smartcase      = true;
    infercase      = true;
    complete       = ".,w,b,k";
    inccommand     = "nosplit";
    grepformat     = "%f:%l:%c:%m";
    grepprg        = 'rg --hidden --vimgrep --smart-case --';
    breakat        = [[\ \	;:,!? ^I!@*-+;:,./?]];
    whichwrap      = "h,l,<,>,[,],~";
    splitbelow     = true;
    splitright     = true;
    switchbuf      = "useopen";
    diffopt        = "filler,iwhite,internal,algorithm:patience";
    completeopt    = "menu,menuone,noselect";
    jumpoptions    = "stack";
    showmode       = false;
    shortmess      = "aoOTIcF";
    scrolloff      = 8;
    sidescrolloff  = 8;
    foldlevelstart = 99;
    ruler          = false;
    list           = true;
    showtabline    = 2;
    winwidth       = 30;
    winminwidth    = 10;
    pumheight      = 12;
    helpheight     = 12;
    previewheight  = 12;
    showcmd        = false;
    cmdheight      = 2;
    cmdwinheight   = 5;
    equalalways    = false;
    display        = "lastline";
    showbreak      = "↳  ";
    listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
    pumblend       = 5;
    winblend       = 0;
    wildoptions    = "pum";
    guicursor      = "i:block";
    cursorline     = true;
  }

  local bw_local  = {
    undofile       = true;
    formatoptions  = "1jcroql";
    textwidth      = 120;
    expandtab      = true;
    tabstop        = 2;
    shiftwidth     = 2;
    softtabstop    = -1;
    breakindentopt = "shift:2,min:20";
    wrap           = false;
    linebreak      = true;
    relativenumber = true;
    colorcolumn    = 120;
    signcolumn     = "yes";
    conceallevel   = 2;
    concealcursor  = "niv";
  }

  if global.is_mac then
    vim.g.clipboard = {
      name = "macOS-clipboard",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy",
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
      },
      cache_enabled = 0
    }
    vim.g.python_host_prog = '/usr/bin/python2'
    vim.g.python3_host_prog = '$HOME/.pyenv/shims/python'
  end
  for name, value in pairs(global_local) do
    vim.o[name] = value
  end
  bind_option(bw_local)
end

load_options()

