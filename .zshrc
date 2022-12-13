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

typeset -U PATH path
export PATH="$HOME/dev/scripts:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export NODE_PATH="/usr/local/lib/node_modules"
export FZF_BASE="/usr/bin/fzf"

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
. ~/.zsh_aliases
alias awsli='awsmfa --identity-profile interfolio --target-profile intf-cicd-mfa && awsmfa --identity-profile interfolio --target-profile interfolio-mfa'
alias tusers='vim ~/dev/workspaces/xena/src/common/data/users.js'
alias remember='vim ~/remember'
alias notes='vim ~/notes'
alias e2e='cd ~/dev/workspaces/e2e-test'
alias xena='cd ~/dev/workspaces/xena'
alias hist='history | grep'
alias searchHere='grep . --exclude-dir \"node_modules\" --exclude-dir \".git\" --color -rnie'

################
# Key bindings #
################

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

###########
# Source #
###########

source $ZSH/oh-my-zsh.sh
## Not sure what this used to do for me???
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
