_SSH_AGENT_LIFETIME=10h
_SSH_AGENT_VARS=~/.ssh-agent.vars.$HOSTNAME


_is_ssh_agent_running()
{
    [[ -n "$SSH_AGENT_PID" ]] && kill -0 $SSH_AGENT_PID 2>/dev/null
}


_run_ssh_agent()
{
    ssh-agent -s -t $_SSH_AGENT_LIFETIME | grep -v ^echo >"$_SSH_AGENT_VARS"
    source "$_SSH_AGENT_VARS"
    ssh-add
}


# Load last ssh-agent variables
if [[ -f "$_SSH_AGENT_VARS" ]]
then
    source "$_SSH_AGENT_VARS"
fi


# Launch the ssh-agent if not already running
_is_ssh_agent_running || _run_ssh_agent
