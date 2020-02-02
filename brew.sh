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
brew install multimarkdown
brew install git-flow
brew install pyenv
brew install mas

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install native apps
brew cask install dropbox 2> /dev/null
brew cask install google-chrome 2> /dev/null
brew cask install google-chrome-canary 2> /dev/null
brew cask install iterm2 2> /dev/null
brew cask install macvim 2> /dev/null
brew cask install miro-video-converter 2> /dev/null
brew cask install opera 2> /dev/null
brew cask install opera-developer 2> /dev/null
brew cask install firefox 2> /dev/null
brew cask install sublime-text 2> /dev/null
brew cask install atom 2> /dev/null
brew cask install the-unarchiver 2> /dev/null
brew cask install transmission 2> /dev/null
brew cask install virtualbox 2> /dev/null
brew cask install vlc 2> /dev/null
brew cask install evernote 2> /dev/null
brew cask install slack 2> /dev/null
brew cask install google-drive 2> /dev/null
brew cask install spotify 2> /dev/null
brew cask install flux 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install steam 2> /dev/null
brew cask install caprine 2> /dev/null
brew cask install github-desktop 2> /dev/null
brew cask install openemu 2> /dev/null
brew cask install xquartz 2> /dev/null
brew cask install inkscape 2> /dev/null
brew cask install gimp 2> /dev/null
brew cask install sketch 2> /dev/null

# Install fonts
brew tap caskroom/fonts
brew cask install font-fira-code 2> /dev/null
brew cask install font-hack 2> /dev/null
brew cask install font-input 2> /dev/null
brew cask install font-jetbrains-mono 2> /dev/null

# Remove outdated versions from the cellar.
brew cleanup
