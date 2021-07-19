#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias ..='cd ..'
alias ll='exa -l'
alias la='lsd -a'
alias cp='cp -iv'
alias rm='rm -I'
alias mv='mv -i'
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

#Sauce
source /usr/share/fzf/key-bindings.bash
source /usr/share/bash-completion/bash_completion

#Variables
export HISTSIZE=10000
export HISTFILESIZE=10000
export TUIR_EDITOR=vim
export BROWSER=firefox
#Colors
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;93m'
MAGENTA='\033[0;95m'
GREEN='\033[0;92m'
