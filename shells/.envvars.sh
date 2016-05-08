# Shell configuration
PS1='\h:\w\$ '
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=10000
export PATH=~/local/packer:~/local/terraform:node_modules/.bin:~/.conda/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
# Locales
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Default editor
export EDITOR=vim
# Less colors for man pages
# src: https://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

if [ -z "$TMUX" ]
then
    export TERM=xterm-256color
fi

if [[ $OSTYPE =~ ^cygwin ]]
then
    export CYGWIN_MIRROR=http://mirror.switch.ch/ftp/mirror/cygwin/
    export VAGRANT_DETECTED_OS=cygwin
fi
