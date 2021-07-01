VIM_PATH="/usr/local/bin/vim"
export PATH=$HOME/bin:$HOME/.local/bin:$VIM_PATH:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
export VISUAL="vim"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

_aliases="${HOME}/.bin/aliases"
if [[ -f ${_aliases} ]]; then
    source "${_aliases}"
fi

plugins=(
    git
    fzf-tab
    zsh-autosuggestions
)

# Install Nix specific plugins if Nix exists
if which nix &>/dev/null; then
    # https://github.com/spwhitt/nix-zsh-completions
    plugins+=nix-zsh-completions
    # https://github.com/chisui/zsh-nix-shell
    # Depends on `nix-zsh-completions`
    plugins+=nix-shell

    source $ZSH/oh-my-zsh.sh

    if ! which starship &>/dev/null; then
        # https://github.com/spwhitt/nix-zsh-completions#oh-my-zsh-installation
        # Has to be set after sourcing `$ZSH/oh-my-zsh.sh`
        prompt_nix_shell_setup
    fi
else
    source $ZSH/oh-my-zsh.sh
fi

if which starship &>/dev/null; then
    export STARSHIP_CONFIG="${HOME}/.config/starship.toml"
    eval "$(starship init zsh)"
fi

# https://nixos.wiki/wiki/Fzf
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
fi
