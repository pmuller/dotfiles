#!/bin/bash -eux

URL=https://raw.githubusercontent.com/Homebrew/install/master/install
PACKAGES="autoconf bash cscope irssi lftp links macvim mplayer mtr
          postgresql puppet python ruby stow tcptraceroute tmux unrar xz zsh"

# Install Homebrew
ruby -e "$(curl -fsSL $URL)"

# Install gpgtools
brew cask install gpgtools

# Install other packages
brew install $PACKAGES
