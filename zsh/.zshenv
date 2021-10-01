# Enviroment variables
VIM="nvim"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#Homebrew's sbin
export PATH="/usr/local/sbin:$PATH"

# Go
export GO111MODULE="on"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin

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
export FZF_DEFAULT_OPTS='--height 90% --layout reverse --border --color "border:#b877db" --preview="bat --color=always {}"'