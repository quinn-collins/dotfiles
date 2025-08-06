#############################################
# Quinn Collins oh-my-zsh/zsh configuration #
#############################################

#####################
# Zsh configuration #
#####################


###########################
# Oh-My-Zsh configuration #
###########################

ZSH_DISABLE_COMPFIX=true


#########################
# Environment variables #
#########################

# For things that won't get committed to source repository
source ~/.zsh_env

typeset -U PATH path
export LOCALBIN=$HOME/.local/bin
export RVM=$HOME/.rvm/bin
export BREWRUBY=/usr/local/opt/ruby/bin
export GOINSTALL=/usr/local/go/bin
export GOPATH=$HOME/go
export NVIMINSTALL=/opt/nvim-linux64/bin
export FZF_BASE=/usr/bin/fzf
export RVMINSTALL=$HOME/.rvm/bin
export ZSH="$HOME/.oh-my-zsh"
export BIN="$HOME/bin"
export CODEQL="$BIN/codeql"

export GREENLIGHT_DB_DSN='postgres://greenlight:pa55word@host.docker.internal/greenlight?sslmode=disable'
export INVOICE_API_DB_DSN='postgres://invoice_api:pa55word@host.docker.internal/invoice_api?sslmode=disable'


export PATH=$PATH:$LOCALBIN:$GOINSTALL:$GOPATH/bin:$NVIMINSTALL:$RVMINSTALL:$BREWRUBY:$RVM:$BIN:$CODEQL

###########
# Plugins #
###########

plugins=(
    git
    npm
    brew
    node
    fzf
    aws
    macos
    iterm2
    docker
    docker-compose
    colored-man-pages
)

#########
# Theme #
#########

ZSH_THEME="robbyrussell"

#############
# Functions #
#############

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

function findStep {
  grep . --exclude-dir="node_modules" --include-dir=**/steps/\*.js  -rie $1
}

function findFeat {
  grep -r -i --include=\*.feature $1 ./
}

function enter {
  docker exec -it $1 bash
}

function root {
  rootdir=$(git rev-parse --show-toplevel)
  if [ -z rootdir ]; then
    echo "Not in a git project."
  else
    push $rootdir
  fi
}

function push {
  pwd=$(pwd)
  if [ -z $1 ]; then
    if [ -f "/tmp/push" ]; then
      pushed=$(head -1 /tmp/push)
      cd $pushed
    else
      cd ~
    fi
  else
    cd $1
  fi
  echo $pwd > /tmp/push
}

function countRequires {
  files=$(searchHere "require\(.*\)$1\(.*\)")
  amount=$(echo "$files" | wc -l | xargs)
  echo "$1 is used in $amount require statements, searched recursively from $(pwd)"
  echo "$files"
}

function enter {
  docker exec -it $1 bash
}

###########
# Aliases #
###########

# For things that won't get committed to source repository
source ~/.zsh_aliases

alias vim='nvim'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot=dotfiles
alias awsli='awsmfa --identity-profile interfolio --target-profile intf-cicd-mfa && awsmfa --identity-profile interfolio --target-profile interfolio-mfa'
alias gdocker='cd ~/dev/workspaces/intf-docker-library'
alias searchHere='grep . --exclude-dir \"node_modules\" --exclude-dir \".git\" --color -rnie'
alias dps='docker ps --format "table {{.Names}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}\t{{.ID}}"'

################
# Key bindings #
################

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

##########
# Source #
##########

# . /usr/share/doc/fzf/examples/key-bindings.zsh
source $ZSH/oh-my-zsh.sh

############################
# Platform Specific Config #
############################

# Mac
if [ "$(uname -s)" = "Darwin" ]; then
  eval "$(rbenv init - zsh)"
fi

# Linux
if [ "$(uname -s)" = "Linux" ]; then

fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
