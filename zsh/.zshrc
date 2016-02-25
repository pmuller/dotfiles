setopt appendhistory beep nomatch
setopt extendedglob
unsetopt autocd notify
# Dear zsh, please let me remove my files freely. Even when I'm wrong.
unsetopt no_rm_star_silent

autoload -Uz compinit
compinit

# Use control+r to search history
bindkey '^R' history-incremental-search-backward

source ~/.vi-mode-prompt.zsh

# Source other scripts
for SCRIPT in ~/.*.sh
do
    source "$SCRIPT"
done

# Fix right prompt trailing white space
if [[ $OSTYPE =~ ^darwin ]]
then
    export ZLE_RPROMPT_INDENT=1
else
    export ZLE_RPROMPT_INDENT=0
fi
