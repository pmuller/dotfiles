# Prompt configuration
BASH_PROMPT_MAX_PATH_LENGTH=${BASH_PROMPT_MAX_PATH_LENGTH-30}
BASH_PROMPT_SHOW_FULL_PATH=${BASH_PROMPT_SHOW_FULL_PATH-0}
BASH_PROMPT_HOST_PARTS=${BASH_PROMPT_HOST_PARTS-0}

# Ask virtualenv to NOT change PS1
VIRTUAL_ENV_DISABLE_PROMPT=1

# git-prompt.sh configuration
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1

# Colors
_COLOR_RESET="\033[0m"
_COLOR_GREEN="\033[0;32m"
_COLOR_YELLOW="\033[0;33m"
_COLOR_BLUE="\033[0;34m"
_COLOR_CYAN="\033[0;36m"
_COLOR_BRIGHT_RED="\033[1;31m"
_COLOR_DARK_GREY="\033[38;5;240m"
_COLOR_GREY="\033[38;5;248m"
# Unicode chars
_UNICODE_ELLIPSIS="\xe2\x80\xa6"

# Default git-prompt.sh location (at least, on CentOS 7)
_GIT_PROMPT=/usr/share/git-core/contrib/completion/git-prompt.sh

# Load git-prompt.sh if available
if [ -f "$_GIT_PROMPT" ]
then
    . "$_GIT_PROMPT"
fi


# Helpers
_ps1_git() {
    if type __git_ps1 >/dev/null 2>&1
    then
        __git_ps1 '%s '
    fi
}

_ps1_host() {
    local HOST

    if [ "$BASH_PROMPT_HOST_PARTS" -gt 0 ]
    then
        # When positive, show first N parts
        HOST=$(echo "$HOSTNAME" | cut -d. -f-$BASH_PROMPT_HOST_PARTS)
    elif [ "$BASH_PROMPT_HOST_PARTS" -lt 0 ]
    then
        # When negative, hide last N parts
        local CUT_START_FIELD=$(( ${BASH_PROMPT_HOST_PARTS/-} + 1 ))
        HOST=$(echo "$HOSTNAME" | rev | cut -d. -f$CUT_START_FIELD- | rev)
    else  # BASH_PROMPT_HOST_PARTS=0
        # When 0, show only the first part
        HOST=${HOSTNAME/.*}
    fi

    echo -n "$HOST"
}

_ps1_last_exit_code() {
    local EXIT_CODE=$?

    if [ "$EXIT_CODE" -ne 0 ]
    then
        echo -n "$EXIT_CODE "
    fi
}

_ps1_job_count() {
    local JOB_COUNT="$(jobs | wc -l)"

    if [ "$JOB_COUNT" -gt 0 ]
    then
        echo -ne "$JOB_COUNT "
    fi
}

_ps1_virtualenv() {
    if [ -n "$VIRTUAL_ENV" ]
    then
        local SHORT_PATH=$(echo "$VIRTUAL_ENV" | rev | cut -d/ -f1-2 | rev)

        if [[ $SHORT_PATH =~ /\.env$ ]]
        then
            SHORT_PATH=${SHORT_PATH/\/*}
        fi

        echo -ne "$SHORT_PATH "
    fi
}

_ps1_cwd() {
    local DIR=${PWD//$HOME/\~}  # Replace $HOME with ~
    local LENGTH=${#DIR}

    # Shorten, if necessary
    if [ "$LENGTH" -gt "$BASH_PROMPT_MAX_PATH_LENGTH" ] && \
        [ "$BASH_PROMPT_SHOW_FULL_PATH" -eq 0 ]
    then
        local LAST_3=$(echo "$PWD" | rev | cut -d/ -f1-3 | rev)
        echo -e "$_UNICODE_ELLIPSIS/$LAST_3"
    else
        echo -e "$DIR"
    fi
}

_ps1_id_color() {
    if [ $UID -eq 0 ]
    then
        # Show the hash in bright red, because we should never forget that
        # doing stuff as root is rarely necessary...
        echo -ne $_COLOR_BRIGHT_RED
    else
        echo -ne $_COLOR_GREY
    fi
}

_ps1_is_ssh() {
    [ -n "$SSH_CONNECTION" ]
}

_ps1_is_ssh_user() {
    [ $UID -ne 0 ] && _ps1_is_ssh
}


PS1="\[$_COLOR_BRIGHT_RED\]\$(_ps1_last_exit_code)\[$_COLOR_YELLOW\]\$(_ps1_job_count)\[$_COLOR_GREY\]$(if _ps1_is_ssh_user; then echo -n $USER; fi)\[$_COLOR_DARK_GREY\]$(if _ps1_is_ssh_user; then echo -n @; fi)\[$(if [[ $HOSTNAME =~ production ]]; then echo -ne $_COLOR_BRIGHT_RED; else echo -ne $_COLOR_GREY; fi;)\]$(if _ps1_is_ssh; then _ps1_host; echo -n ' '; fi)\[$_COLOR_CYAN\]\$(_ps1_virtualenv)\[$_COLOR_BLUE\]\$(_ps1_cwd) \[$_COLOR_GREEN\]\$(_ps1_git)\[$(_ps1_id_color)\]\\$\[$_COLOR_RESET\] "
