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
export PATH="$HOME/go/bin:/usr/local/mysql/bin:/usr/local/go/bin:$HOME/dev/scripts:$PATH"
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
#
###########
. ~/.zsh_aliases
alias awsli='awsmfa --identity-profile interfolio --target-profile intf-cicd-mfa && awsmfa --identity-profile interfolio --target-profile interfolio-mfa'
alias notes='vim ~/notes'
alias e2e='cd ~/dev/workspaces/e2e-test'
alias xena='cd ~/dev/workspaces/xena'
alias user='cd ~/dev/workspaces/user-api'
alias unit='cd ~/dev/workspaces/unit-api'
alias intf='cd ~/dev/workspaces/intf-docker-library'
alias searchHere='grep . --exclude-dir \"node_modules\" --exclude-dir \".git\" --color -rnie'
alias drop-unit-schema='docker exec -it postgres-14 psql -U postgres -d unit_api_test -c "DROP SCHEMA public CASCADE;" \
                      && docker exec -it postgres-14 psql -U postgres -d unit_api_test -c "CREATE SCHEMA public"       \
                      && docker exec -it unit-api go run main.go migrate up -d unit_api_test'
alias seed-user='docker exec -it postgres-14 psql -U postgres -d user_api_development -a -f /user-testdata/seed.sql'
alias seed-unit='docker exec -it postgres-14 psql -U postgres -d unit_api_development -a -f /unit-testdata/seed.sql'
alias dps='docker ps --format "table {{.Names}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}\t{{.ID}}"'

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

. /usr/share/doc/fzf/examples/key-bindings.zsh
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
export GREENLIGHT_DB_DSN='postgres://greenlight:pa55word@localhost/greenlight?sslmode=disable'
