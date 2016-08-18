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

elif [[ $OSTYPE =~ ^cygwin ]]
then
    # Web browser
    alias www="/cygdrive/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
    # Vagrant
    alias vagrant="/cygdrive/c/HashiCorp/Vagrant/bin/vagrant.exe"
    # Cygwin
    alias cyginstall='cygsetup --quiet-mode --no-shortcuts --no-desktop --no-startmenu --root "$(cygpath -m /)" --local-package-dir "$(cygpath -w /packages)" --site $CYGWIN_MIRROR --packages'
    # VirtualBox
    alias VBoxManage='/cygdrive/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe'
    # Use procps' ps (the cygwin standard "ps" does not show programs arguments)
    alias ps=procps
    # Use Windows' native ping, because Cygwin's ping requires admin privileges
    alias ping=/cygdrive/c/Windows/System32/PING.EXE

elif [[ $OSTYPE =~ ^darwin ]]
then
    alias ls='ls -FGh'
    alias www=open
    alias pg_start='pg_ctl -D ~/dev/pgdata start'
fi
