setopt appendhistory beep nomatch
setopt extendedglob
unsetopt autocd notify
#bindkey -v

autoload -Uz compinit
compinit

# Use control+r to search history
bindkey '^R' history-incremental-search-backward

# Source other scripts
for SCRIPT in ~/.*.sh
do
    source "$SCRIPT"
done

# Fix right prompt trailing white space
export ZLE_RPROMPT_INDENT=0
