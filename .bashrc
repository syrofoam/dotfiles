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
# Aliases
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;34m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi
alias mupdf='mupdf-gl -I'
alias ll='exa -l'
alias la='lsd -a'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -i'

#export FZF_CTRL_R_OPTS='--sort --exact'
source /usr/share/fzf/key-bindings.bash
source /usr/share/bash-completion/bash_completion
alias ..="cd .."

#Colors
. "/home/stian/.local/share/lscolors.sh"
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;93m'
MAGENTA='\033[0;95m'
GREEN='\033[0;92m'

#Greeter
uname --kernel-release

echo -e "${YELLOW}iptables ${GREEN}[OK]"
echo -e "${YELLOW}google tracking ${RED}[Failed]"
echo -e "${RED}welcome to ${MAGENTA}${HOSTNAME} ${BLUE}${USER}"
echo -e "\033[31;1;4mall systems activated\033[0m"
echo -e "\033[0;95mawaiting input"
