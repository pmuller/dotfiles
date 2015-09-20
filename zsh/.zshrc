setopt appendhistory beep nomatch
unsetopt autocd extendedglob notify
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
