#!/bin/bash -eux

URL=https://raw.githubusercontent.com/Homebrew/install/master/install
PACKAGES="autoconf bash cscope irssi lftp links macvim mplayer mtr
          postgresql puppet python ruby stow tcptraceroute tmux unrar xz zsh"

ruby -e "$(curl -fsSL $URL)"
brew install $PACKAGES
