# Automatically load virtualenvs when in sub-directories of this directory
VIRTUALENV_BASE_DIR=${VIRTUALENV_BASE_DIR-$HOME}
# Normalized name of virtualenvs directories
VIRTUALENV_NAME=${VIRTUALENV_NAME-'.env'}


_auto_virtualenv() {
    local CURRENT_DIR=$PWD
    local FOUND=0

    # Ignore directories outside $VIRTUALENV_BASE_DIR
    if [ "${PWD:0:${#VIRTUALENV_BASE_DIR}}" != "$VIRTUALENV_BASE_DIR" ]
    then
        return
    fi

    while true
    do
        local ENV_DIR="$CURRENT_DIR/$VIRTUALENV_NAME"
        local ACTIVATE="$ENV_DIR/bin/activate"

        if [ -f "$ACTIVATE" ]
        then
            # Source virtualenv if not already active
            if [ -z "$VIRTUAL_ENV" ] || [ "$VIRTUAL_ENV" != "$ENV_DIR" ]
            then
                source "$ACTIVATE"
            fi

            FOUND=1
            break

        # Stop loop when reaching $VIRTUALENV_BASE_DIR or /
        elif [ "$CURRENT_DIR" == "$VIRTUALENV_BASE_DIR" ] \
            || [ "$CURRENT_DIR" == "/" ]
        then
            break
        fi

        # Try parent directory in next iteration
        CURRENT_DIR=$(dirname "$CURRENT_DIR")
    done

    # Automatically deactivate current virtualenv if not matching current
    # directory
    if [ "$FOUND" -eq 0 ] && [ -n "$VIRTUAL_ENV" ]
    then
        deactivate
    fi
}


# Setup the magic
if [ "$(type cd)" == "cd is a shell builtin" ]
then
    cd() {
        builtin cd "$@"
        _auto_virtualenv
    }
fi
