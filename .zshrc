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

# GIT HELPER
alias gbrs='git branch --sort=-committerdate'
alias uuu='omz update && brew update && brew upgrade -q && clear && omz reload'

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/moonbrv/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
