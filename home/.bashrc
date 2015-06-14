#/bin/bash

# env
export PS1="\w "
export EDITOR="vim"

# use vim for manpages
export MANPAGER="sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-completion ]; then
    . ~/.git-completion
fi

# docker autocomplete
source /etc/bash_completion.d/docker
