# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# enable autoload
fpath=($fpath autoloaded)

# Path to your oh-my-zsh installation.
export ZSH="/Users/moonbrv/.oh-my-zsh"

ZSH_THEME="refined"

plugins=(
  git
  aliases
  python
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# for GPG signing before deploy to clojars
export GPG_TTY=$(tty)

# localisation settings
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# git
alias gbrs='git branch --sort=-committerdate'
alias gcaa='git commit --amend'
# docker
alias dps='docker ps'
alias dcps='docker compose ps'

alias ld='lazydocker'

# python
function pyinstall() {
    python3 -m pip install -r $1
}

function lscr() {
  cat package.json | jq .scripts
}

alias vv='nvim'
alias nv='nvim'
alias top='btop'

# see https://github.com/ofirgall/tmux-window-name
# tmux-window-name() {
# 	($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
# }

# add-zsh-hook chpwd tmux-window-name

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"


# for yazi file manager
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd"  ] && [ "$cwd" != "$PWD"  ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# setup FZF
source <(fzf --zsh)

[ -f "/Users/moonbrv/.ghcup/env" ] && source "/Users/moonbrv/.ghcup/env" # ghcup-env

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"
