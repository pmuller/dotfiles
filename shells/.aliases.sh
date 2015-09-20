alias less='less -r'
alias df='df -h'
alias du='du -h'
alias vi=vim
alias ls='ls --color'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# PostgreSQL dev aliases
alias pg_start='pg_ctl -D ~/dev/pgdata start'

if [[ $OSTYPE =~ ^cygwin ]]
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
elif [[ $OSTYPE =~ ^darwin ]]
then
    alias ls='ls -FGh'
    alias www=open
fi
