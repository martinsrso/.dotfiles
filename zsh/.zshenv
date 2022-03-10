# Enviroment variables
VIM="nvim"

# alias
alias rm="rm -d -i"
alias vi="nvim"
alias ll="ls -l"
alias la="ls -la"
alias lt="ls --tree"
alias ls="exa --icons --header"
alias reload="source ~/.zshrc"
alias luamake=/Users/rafael.martins/tmp/lua-language-server/3rd/luamake/luamake

# You may need to manually set your language environment
export LANG=en_US.UTF-8
#Homebrew's sbin export PATH="/usr/local/sbin:$PATH"

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
export BAT_THEME="Solarized (light)"
# export BAT_THEME="OneHalfLight"
# export CLICOLOR=1
# export LSCOLORS='gxBxhxDxfxhxhxhxhxcxcx'
# export LS_COLORS='gxBxhxDxfxhxhxhxhxcxcx'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#b3b3b3'

# Fzf
export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_COMMAND='rg --files --hidden'
# export FZF_DEFAULT_OPTS='--height 90% --layout reverse --border --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33 --color info:33,prompt:33,pointer:166,marker:166,spinner:33 --inline-info'
# export FZF_DEFAULT_OPTS='--height 90% --layout reverse --border --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235 --preview "bat --color=always --style=plain {}"'

export JDTLS_HOME="/Users/rafael.martins/.local/jdt-language-server"
export LOMBOK_JAR="/Users/rafael.martins/.local/lombok/lombok.jar"

export ZSH_CACHE_DIR="$HOME/.zsh_cache"

. "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#

_gen_fzf_default_opts() {
  local base03="#002b36"
  local base02="#073642"
  local base01="#586e75"
  local base00="#657b83"
  local base0="#839496"
  local base1="#93a1a1"
  local base2="#eee8d5"
  local base3="#fdf6e3"
  local yellow="#b58900"
  local orange="#cb4b16"
  local red="#dc322f"
  local magenta="#d33682"
  local violet="#6c71c4"
  local blue="#268bd2"
  local cyan="#2aa198"
  local green="#859900"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #   --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #   --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  # "
  # Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
   --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base1,hl+:$blue
   --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  "
}
_gen_fzf_default_opts

# SSL
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export OPENSSL_ROOT_DIR="/usr/local/opt/openssl@1.1"

# export DISABLE_AUTO_TITLE="true"
# function precmd () {
#   window_title="\033]0;${PWD##*/}\007"
#   echo -ne "$window_title"
# }

if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
