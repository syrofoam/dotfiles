if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
#end fedora

alias ls='ls --color=auto'
alias l='ls -lrt'
alias ll='eza -lr -snew'
alias ..='cd ..'
alias cp='cp -ivr'
alias rm='rm -I'
alias mv='mv -i'
alias p="ps aux | grep "

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[$(tput setaf 49)\]\u\[$(tput setaf 69)\]@\[$(tput setaf 202)\]\h \[$(tput setaf 91)\]\w   \[$(tput sgr0)\]$ '
fi

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
source $HOME/.config/key-bindings.bash
