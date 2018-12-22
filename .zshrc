#############################################
# Quinn Collins oh-my-zsh/zsh configuration #
#############################################

#####################
# Zsh configuration #
#####################

# enable autocomplete
autoload -Uz compinit
compinit
# autocompletion with arrow-keys
zstyle ':completion*' menu select
# autocompletion aliases
setopt COMPLETE_ALIASES
# Filtered history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search



###########################
# Oh-My-Zsh configuration #
###########################

# case-sensitive completion
CASE_SENSITIVE="true"
# disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"
# enable command auto-correction
ENABLE_CORRECTION="true"
# display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"


#########################
# Environment variables #
#########################

# Path to your oh-my-zsh installation.
export ZSH="/Users/quinn/.oh-my-zsh"
# Path to VIM install
export VIMRUNTIME=/usr/local/Cellar/vim/8.1.0600/share/vim/vim81
# Path variable
export PATH="/usr/local/Cellar/vim/8.1.0600/bin:$PATH"


###########
# Plugins #
###########

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git docker zsh-syntax-highlighting
)


#########
# Theme #
#########

# robbyrussell/oh-my-zsh
ZSH_THEME="robbyrussell"


###########
# Aliases #
###########
alias config='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

################
# key bindings #
################

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line


source $ZSH/oh-my-zsh.sh 

