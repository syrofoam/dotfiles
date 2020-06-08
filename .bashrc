#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
export HISTSIZE=10000
export HISTFILESIZE=2000

alias ls='ls --color=auto'
alias gl='git --no-pager log -n24 --pretty=oneline --abbrev-commit --graph'
alias gp='git --no-pager branch-r'
#PS1='[\u@\h \W]\$ '
# Gentoo (/etc/bash/bashrc)
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;34m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi
alias mupdf='mupdf-gl -I'
#export FZF_CTRL_R_OPTS='--sort --exact'
source /usr/share/fzf/key-bindings.bash
source /usr/share/bash-completion/bash_completion
alias ..="cd .."

. "/home/stian/.local/share/lscolors.sh"
