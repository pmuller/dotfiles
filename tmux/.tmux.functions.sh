new_tmux_django_session()
{
    local SESSION=$1

    if [[ -z "$SESSION" ]]
    then
        echo "Usage: create_tmux_django_session <name>"
        return 1
    fi

    tmux new-session $SESSION_CREATE_ARGS -d -n code vim
    tmux rename-session $SESSION
    tmux new-window -n shell
    tmux new-window -n python "./manage.py shell"
    tmux new-window -n server "./manage.py runserver"
    tmux select-window -t code
    tmux attach $SESSION_ATTACH_ARGS
}
