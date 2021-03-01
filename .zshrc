VIM_PATH="/usr/local/bin/vim"
export PATH=$HOME/bin:$HOME/.local/bin:$VIM_PATH:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
export VISUAL="vim"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# https://nixos.wiki/wiki/Fzf
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

_aliases="${HOME}/.bin/aliases"
[[ -f ${_aliases} ]] && source "${_aliases}"
