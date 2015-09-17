setopt appendhistory beep nomatch
unsetopt autocd extendedglob notify
#bindkey -v

autoload -Uz compinit
compinit

# Use control+r to search history
bindkey '^R' history-incremental-search-backward

# Load the promptline script
source ~/.shell_prompt.sh
# Load environment variables
source ~/.envvars
# Load aliases
source ~/.aliases
