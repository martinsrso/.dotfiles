# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet snippet OMZ::lib/git.zsh
zcomet snippet OMZ::lib/history.zsh
zcomet snippet OMZ::lib/key-bindings.zsh
zcomet snippet OMZ::lib/completion.zsh
zcomet snippet OMZ::lib/grep.zsh

# zcomet load ohmyzsh/ohmyzsh
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/docker-compose
zcomet load ohmyzsh plugins/gitignore
zcomet load ohmyzsh plugins/gcloud
zcomet load ohmyzsh plugins/helm
zcomet load ohmyzsh plugins/colored-man-pages
zcomet load ohmyzsh plugins/kubectl
zcomet load ohmyzsh plugins/terraform
zcomet load hlissner/zsh-autopair
zcomet load romkatv/powerlevel10k
zcomet load zdharma-continuum/history-search-multi-word

# It is good to load these popular plugins last, and in this order:
# zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

zcomet load MichaelAquilina/zsh-you-should-use
zcomet load Aloxaf/fzf-tab
zcomet load zdharma-continuum/fast-syntax-highlighting

zcomet load jreese/zsh-titles

fpath+=${ZDOTDIR:-~}/.zsh_functions

source ~/.zshenv

# # zstyle ':completion:*:default' list-colors
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zcomet compinit

# [[ ! -f ~/.p10k-robbyrussell.zsh ]] || source ~/.p10k-robbyrussell.zsh

# eval "$(pyenv init --path)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/oliveira.rafael/.sdkman"
# [[ -s "/Users/oliveira.rafael/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/oliveira.rafael/.sdkman/bin/sdkman-init.sh"
