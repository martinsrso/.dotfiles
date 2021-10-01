if status is-interactive
    # Commands to run in interactive sessions can go here
    set --universal -x FZF_DEFAULT_OPTS '--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235'

  # variable 
  set --universal -x LANG 'en_US.UTF-8'
  set --universal -x GOPATH $HOME/go
  set --universal -x GOBIN $GOPATH/bin
  set --universal -x GO111MODULE on
  set --universal -x EDITOR nvim
  set --universal -x GIT_EDITOR nvim
  set --universal -x BAT_THEME 'Solarized (dark)'
  set --universal -x FZF_COMPLETION_TRIGGER '**'
  set --universal -x FZF_DEFAULT_COMMAND 'rg --files --hidden' 

  fish_add_path $GOBIN
  # fish_add_path "/usr/local/sbin"
  # fish_add_path "/usr/local/opt/llvm/bin"

  alias vi="nvim"
  alias ll="ls -l"
  alias la="ls -la"
  alias lt="ls --tree"
  alias ls="exa --icons -g"
  alias reload="source ~/.config/fish/config.fish"
  # alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

  # set --universal tide_right_prompt_items status cmd_duration context jobs node virtual_env php go
  # set -a tide_right_prompt_items kubectl
  # set -gx tide_show_kubectl_on kubectl helm kubens kubectx stern

  starship init fish | source
end

