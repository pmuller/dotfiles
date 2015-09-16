setopt appendhistory beep nomatch
unsetopt autocd extendedglob notify
#bindkey -v

autoload -Uz compinit
compinit

# Load the promptline script
source ~/.shell_prompt.sh

# Load environment variables
source ~/.envvars
# Load aliases
source ~/.aliases
