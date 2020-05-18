#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install heroku
brew install nvm
brew install pyenv
brew install mas
brew install redis
brew install postgresql
brew install rust
brew install zsh
brew install kryptco/tap/kr

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
brew cask install google-drive 2> /dev/null
brew cask install spotify 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install steam 2> /dev/null
brew cask install caprine 2> /dev/null
brew cask install openemu 2> /dev/null
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
