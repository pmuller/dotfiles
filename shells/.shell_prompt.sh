# Shorten $CWD when above this value (set to 0 to disable)
BASH_PROMPT_MAX_PATH_LENGTH=${BASH_PROMPT_MAX_PATH_LENGTH-30}
# Which parts of $HOSTNAME should be shown
#  0: Show the full $HOSTNAME
#  positive: Show the N first parts
#  negative: Hide the last N parts
BASH_PROMPT_HOST_PARTS=${BASH_PROMPT_HOST_PARTS-1}
# Colors
#  Git (default: green)
BASH_PROMPT_COLOR_GIT=${BASH_PROMPT_COLOR_GIT-"\e[0;32m"}
#  Background jobs (default: yellow)
BASH_PROMPT_COLOR_JOBS=${BASH_PROMPT_COLOR_JOBS-"\e[0;33m"}
#  Current working directory (default: blue)
BASH_PROMPT_COLOR_CWD=${BASH_PROMPT_COLOR_CWD-"\e[0;34m"}
#  Virtualenv (default: cyan)
BASH_PROMPT_COLOR_VIRTUALENV=${BASH_PROMPT_COLOR_VIRTUALENV-"\e[0;36m"}
#  Last command exit code (default: bright red)
BASH_PROMPT_COLOR_EXIT_CODE=${BASH_PROMPT_COLOR_EXIT_CODE-"\e[1;31m"}
#  user@host separator (the @ sign, default: dark grey)
BASH_PROMPT_COLOR_USER_HOST_SEP=${BASH_PROMPT_COLOR_USER_HOST_SEP-"\e[38;5;240m"}
#  The hostname (default: grey)
BASH_PROMPT_COLOR_HOST=${BASH_PROMPT_COLOR_HOST-"\e[38;5;248m"}
#  The hostname, when it contains "production" (default: bright red)
BASH_PROMPT_COLOR_HOST_PROD=${BASH_PROMPT_COLOR_HOST_PROD-"\e[1;31m"}
#  Username, and $ sign (default: grey)
BASH_PROMPT_COLOR_USER=${BASH_PROMPT_COLOR_USER-"\e[38;5;248m"}
#  The # sign, for root shells (default: bright red)
BASH_PROMPT_COLOR_ROOT=${BASH_PROMPT_COLOR_ROOT-"\e[1;31m"}

# Ask virtualenv to NOT change PS1
VIRTUAL_ENV_DISABLE_PROMPT=1

# git-prompt.sh configuration
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1

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
    if [ "$BASH_PROMPT_HOST_PARTS" -eq 0 ]
    then
        echo -n $HOSTNAME
    elif [ "$BASH_PROMPT_HOST_PARTS" -eq 1 ]
    then
        echo -n ${HOSTNAME/.*}
    elif [ "$BASH_PROMPT_HOST_PARTS" -gt 1 ]
    then
        # When positive, show first N parts
        echo -n $(echo $HOSTNAME | cut -d. -f-$BASH_PROMPT_HOST_PARTS)
    else # [ "$BASH_PROMPT_HOST_PARTS" -lt 0 ]
        # When negative, hide last N parts
        local CUT_START_FIELD=$(( ${BASH_PROMPT_HOST_PARTS/-} + 1 ))
        echo -n $(echo $HOSTNAME | rev | cut -d. -f$CUT_START_FIELD- | rev)
    fi
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
    if [ $BASH_PROMPT_MAX_PATH_LENGTH -gt 0 ] && \
        [ "$LENGTH" -gt "$BASH_PROMPT_MAX_PATH_LENGTH" ]
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
        echo -ne $BASH_PROMPT_COLOR_ROOT
    else
        echo -ne $BASH_PROMPT_COLOR_USER
    fi
}

_ps1_is_ssh() {
    [ -n "$SSH_CONNECTION" ]
}

_ps1_is_ssh_user() {
    [ $UID -ne 0 ] && _ps1_is_ssh
}


PS1="\[$BASH_PROMPT_COLOR_EXIT_CODE\]\$(_ps1_last_exit_code)\[$BASH_PROMPT_COLOR_JOBS\]\$(_ps1_job_count)\[$BASH_PROMPT_COLOR_USER\]$(if _ps1_is_ssh_user; then echo -n $USER; fi)\[$BASH_PROMPT_COLOR_USER_HOST_SEP\]$(if _ps1_is_ssh_user; then echo -n @; fi)\[$(if [[ $HOSTNAME =~ production ]]; then echo -ne $BASH_PROMPT_COLOR_HOST_PROD; else echo -ne $BASH_PROMPT_COLOR_HOST; fi;)\]$(if _ps1_is_ssh; then _ps1_host; echo -n ' '; fi)\[$BASH_PROMPT_COLOR_VIRTUALENV\]\$(_ps1_virtualenv)\[$BASH_PROMPT_COLOR_CWD\]\$(_ps1_cwd) \[$BASH_PROMPT_COLOR_GIT\]\$(_ps1_git)\[$(_ps1_id_color)\]\\$\[\e[m\] "
