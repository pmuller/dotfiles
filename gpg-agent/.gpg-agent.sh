_GPG_AGENT_LIFETIME=36000
_GPG_AGENT_VARS=~/.gpg-agent.vars.$(hostname -f)


_is_gpg_agent_running()
{
    if [ -n "$GPG_AGENT_INFO" ]
    then
        local PID=$(echo $GPG_AGENT_INFO | cut -d: -f2)
        if [[ -n "$PID" && $PID > 0 ]]
        then
            if kill -0 $PID 2>/dev/null
            then
                return 0
            else
                return 1
            fi
        else
            return 1
        fi
    else
        return 1
    fi
}


_run_gpg_agent()
{
    gpg-agent --daemon --use-standard-socket --enable-ssh-support \
        --default-cache-ttl $_GPG_AGENT_LIFETIME >"$_GPG_AGENT_VARS"
    source "$_GPG_AGENT_VARS"
}


# Load last gpg-agent variables
if [[ -f "$_GPG_AGENT_VARS" ]]
then
    source "$_GPG_AGENT_VARS"
fi

# Launch the gpg-agent if not already running
_is_gpg_agent_running || _run_gpg_agent
