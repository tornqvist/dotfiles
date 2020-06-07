#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils

# Install shells
brew install bash
brew install bash-completion2
brew install zsh

# Switch to using brew-installed zsh as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install tree
brew install pyenv
brew install mas
brew install redis
brew install postgresql
brew install rust
brew install kryptco/tap/kr

# Install heroku
brew tap heroku/brew
brew install heroku

# Install Mongo
brew tap mongodb/brew
brew install mongodb-community

# Tap cask version
brew tap homebrew/cask-versions

# Install native apps
brew cask install google-chrome 2> /dev/null
brew cask install google-chrome-canary 2> /dev/null
brew cask install opera 2> /dev/null
brew cask install firefox 2> /dev/null
brew cask install firefoxdeveloperedition 2> /dev/null
brew cask install sublime-text 2> /dev/null
brew cask install sublime-merge 2> /dev/null
brew cask install the-unarchiver 2> /dev/null
brew cask install transmission 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install vlc 2> /dev/null
brew cask install iina 2> /dev/null
brew cask install slack 2> /dev/null
brew cask install spotify 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install steam 2> /dev/null
brew cask install caprine 2> /dev/null
brew cask install xquartz 2> /dev/null
brew cask install sketch 2> /dev/null
brew cask install docker 2> /dev/null
brew cask install figma 2> /dev/null
brew cask install irccloud 2> /dev/null
brew cask install krisp 2> /dev/null
brew cask install ngrok 2> /dev/null
brew cask install notion 2> /dev/null
brew cask install soundflower 2> /dev/null
brew cask install zoomus 2> /dev/null
brew cask install visual-studio-code 2> /dev/null

# Install fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code 2> /dev/null
brew cask install font-hack 2> /dev/null
brew cask install font-input 2> /dev/null
brew cask install font-jetbrains-mono 2> /dev/null

# Remove outdated versions from the cellar.
brew cleanup
