# Shell configuration
PS1='\h:\w\$ '
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=10000
export PATH=node_modules/.bin:~/.conda/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
# Locales
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Default editor
export EDITOR=vim
export TERM=xterm-256color

if [[ $OSTYPE =~ ^cygwin ]]
then
    export CYGWIN_MIRROR=http://mirror.switch.ch/ftp/mirror/cygwin/
    export VAGRANT_DETECTED_OS=cygwin
fi
