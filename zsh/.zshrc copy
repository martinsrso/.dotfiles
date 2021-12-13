# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files source by it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Move prompt to the bottom when zsh starts and on Ctrl+L.
zstyle ':z4h:' prompt-at-bottom 'yes'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'yes'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# ssh when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over ssh to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
export GPG_TTY=$TTY

# You may need to manually set your language environment
export LANG=en_US.UTF-8
#Homebrew's sbin export 
PATH="/usr/local/sbin:$PATH"

# Go
export GO111MODULE="on"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Cland
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Editor
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export REACT_EDITOR="nvim"

# Bat
export BAT_THEME="Solarized (dark)"

# Fzf
export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
# export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 90% --layout reverse --border --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235  --inline-info'
# export FZF_DEFAULT_OPTS='--height 90% --layout reverse --border --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235 --preview "bat --color=always --style=plain {}"'

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
z4h source ohmyzsh/ohmyzsh/lib/history.zsh  # source an individual file
z4h source ohmyzsh/ohmyzsh/lib/key-bindings.zsh  # source an individual file
z4h source ohmyzsh/ohmyzsh/lib/completion.zsh  # source an individual file
z4h source ohmyzsh/ohmyzsh/lib/grep.zsh  # source an individual file
z4h load   ohmyzsh/ohmyzsh/plugins/git  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/colored-man-pages  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/extract  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/docker  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/gitignore  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/gcloud  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/helm  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/kubectl  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/pyenv  # load a plugin
z4h load   ohmyzsh/ohmyzsh/plugins/terraform  # load a plugin
z4h load   hlissner/zsh-autopair
z4h load   MichaelAquilina/zsh-you-should-use

# Define key bindings.
z4h bindkey undo Ctrl+/  # undo the last command line change
z4h bindkey redo Alt+/   # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'
alias vi="nvim"
alias ll="ls -l"
alias la="ls -la"
alias lt="ls --tree"

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# Enviroment variables
VIM="nvim"

# alias
alias reload="source ~/.zshrc"
alias luamake=/Users/rafael.martins/tmp/lua-language-server/3rd/luamake/luamake

[[ ! -v functions[command_not_found_handler] ]] || unfunction command_not_found_handler
# eval "$(pyenv init --path)"
