alias less='less -r'
alias df='df -h'
alias du='du -h'
alias vi=vim
alias ls='ls --color'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

if [[ $OSTYPE =~ ^linux ]]
then
    # Source PostgreSQL SCL
    source /opt/rh/rh-postgresql95/enable
    alias pg_start='pg_ctl -D /var/run/postgresql start'

    # Use Python 3.5 from SCL
    source /opt/rh/rh-python35/enable

elif [[ $OSTYPE =~ ^darwin ]]
then
    alias ls='ls -FGh'
    alias www=open
    alias pg_start='pg_ctl -D ~/dev/pgdata start'
fi
