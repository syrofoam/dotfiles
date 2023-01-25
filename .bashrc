#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias ..='cd ..'
alias ll='exa -l'
#alias la='lsd -a'
alias cp='cp -ivr' #recursive interactive verbose
alias rm='rm -I'
alias mv='mv -i'
alias p="ps aux | grep "

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[$(tput setaf 49)\]\u\[$(tput setaf 69)\]@\[$(tput setaf 202)\]\h \[$(tput setaf 91)\]\w \[$(tput sgr0)\]$ '
fi

#Saurce
#source /usr/share/fzf/key-bindings.bash

#Variables
export HISTSIZE='10000'
export HISTFILESIZE='10000'
export EDITOR='vim'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
