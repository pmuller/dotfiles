# Prompt configuration
_BASH_PROMPT_MAX_PATH_LENGTH=30
_BASH_PROMPT_SHOW_FULL_PATH=0
_BASH_PROMPT_HOST_PARTS=1
_BASH_PROMPT_SHOW_LOCAL_USER_HOST=0

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
        __git_ps1 "$_COLOR_GREEN%s$_COLOR_RESET "
    fi
}

_ps1_user_host() {
    if [ -n "$SSH_CONNECTION" ] || \
        [ "$_BASH_PROMPT_SHOW_LOCAL_USER_HOST" != "0" ]
    then
        local HOST

        if [ "$_BASH_PROMPT_HOST_PARTS" -gt 0 ]
        then
            # When positive, show first N parts
            HOST=$(echo "$HOSTNAME" | cut -d. -f-$_BASH_PROMPT_HOST_PARTS)
        elif [ "$_BASH_PROMPT_HOST_PARTS" -lt 0 ]
        then
            # When negative, hide last N parts
            local CUT_START_FIELD=$(( "$_BASH_PROMPT_HOST_PARTS" + 1 ))
            HOST=$(echo "$HOSTNAME" | rev | cut -d. -f$CUT_START_FIELD- | rev)
        else  # _BASH_PROMPT_HOST_PARTS=0
            # When 0, show only the first part
            HOST=${HOSTNAME/.*}
        fi

        # Hide "root@" because the hash at the end of the prompt already
        # gives the information
        if [ "$(id -u)" -ne 0 ]
        then
            echo -ne "$_COLOR_GREY$USER$_COLOR_DARK_GREY@$_COLOR_RESET"
        fi

        if [[ "$HOSTNAME" =~ production ]]
        then
            echo -ne "$_COLOR_BRIGHT_RED$HOST$_COLOR_RESET "
        else
            echo -ne "$_COLOR_GREY$HOST$_COLOR_RESET "
        fi
    fi
}

_ps1_last_exit_code() {
    local EXIT_CODE=$?

    if [ "$EXIT_CODE" -ne 0 ]
    then
        echo -ne "$_COLOR_BRIGHT_RED$EXIT_CODE$_COLOR_RESET "
    fi
}

_ps1_job_count() {
    local JOB_COUNT="$(jobs | wc -l)"

    if [ "$JOB_COUNT" -gt 0 ]
    then
        echo -ne "$_COLOR_YELLOW$JOB_COUNT$_COLOR_RESET "
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

        echo -ne "$_COLOR_CYAN$SHORT_PATH$_COLOR_RESET "
    fi
}

_ps1_cwd() {
    local DIR=${PWD//$HOME/\~}  # Replace $HOME with ~
    local LENGTH=${#DIR}

    # Shorten, if necessary
    if [ "$LENGTH" -gt "$_BASH_PROMPT_MAX_PATH_LENGTH" ] && \
        [ "$_BASH_PROMPT_SHOW_FULL_PATH" -eq 0 ]
    then
        local LAST_3=$(echo "$PWD" | rev | cut -d/ -f1-3 | rev)
        echo -e "$_COLOR_BLUE$_UNICODE_ELLIPSIS/$LAST_3$_COLOR_RESET "
    else
        echo -e "$_COLOR_BLUE$DIR$_COLOR_RESET "
    fi
}

_ps1_id_symbol() {
    if [ "$(id -u)" -eq 0 ]
    then
        # Show the hash in bright red, because we should never forget that
        # doing stuff as root is rarely necessary...
        echo -ne "$_COLOR_BRIGHT_RED#$_COLOR_RESET "
    else
        echo -ne "$_COLOR_GREY\$$_COLOR_RESET "
    fi
}


PS1="\$(_ps1_last_exit_code)\$(_ps1_job_count)$(_ps1_user_host)\$(_ps1_virtualenv)\$(_ps1_cwd)\$(_ps1_git)$(_ps1_id_symbol)"
