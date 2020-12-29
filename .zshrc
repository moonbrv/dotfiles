export ZSH="/Users/dmytro.palamarchuk/.oh-my-zsh"

ZSH_THEME="amuse"

plugins=(
  git
  colored-man-pages
  colorize
  command-not-found
  brew
  history
  kubectl
  nvm
  lein
  fasd
  docker
  dotenv
  httpie
  osx
  tmux
  z
  extract
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
fpath=(/usr/local/share/zsh-completions $fpath)

# for GPG signing before deploy to clojars
export GPG_TTY=$(tty)

func ivc() {
    VERSION_UPDATE=$(python /usr/local/bin/iv.py ./project.clj | tr -d  '\n')
    git add project.clj
    git commit -m $VERSION_UPDATE
}

function ssh-fab() {
  PROFILES=`fab profiles:short`
  if [ -n "${1}" ]; then
    MATCHED=`echo "${PROFILES}"|grep ${1}`
    NUM_MATCHED=`echo "${PROFILES}"|grep -c ${1}`
    if [ $(( NUM_MATCHED )) = 1 ]; then
      HOST=`echo "${MATCHED}" | head -n 1 | sed -e 's/: /:/g' | cut -f 2 -d : `
      echo "${MATCHED}" | grep --color=always ${1}
      ssh ${HOST} ${@:2}
    elif [ $(( NUM_MATCHED )) = 0 ]; then
      echo "Not found: ${1}"
      echo "${PROFILES}"
    else
      echo "Found many:"
      echo "${MATCHED}" | grep --color=always ${1}
    fi
  else
    echo "Usage: ${0} PROFILE [SSH-OPTS]\nProfiles:"
    echo "${PROFILES}"
  fi
}

# DOCKER HELPERS
alias dsrc="docker stop $(docker ps -aq)"
alias drac="docker rm $(docker ps -aq)"
alias drai="docker rmi $(docker images -q)"
alias dk='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

alias gbrs='git branch --sort=-committerdate'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_FALLBACK_LIBRARY_PATH

# override amuse theme defaults
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\u2387 "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[orange]%}!"
PROMPT='
%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info) %{$fg_bold[red]%}%*%{$reset_color%}
$ '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dmytro.palamarchuk/.sdkman"
[[ -s "/Users/dmytro.palamarchuk/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dmytro.palamarchuk/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/sbin:$PATH"
