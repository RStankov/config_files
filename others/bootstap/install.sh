#!/bin/bash

# Tools
brew install wget
brew install zsh
brew install git
brew install macvim
brew install ruby-build
brew install rbenv
brew install node
brew install nvm
brew install imagemagick
brew install tree
brew install elixir
brew install erlang
brew install rust

# Cask
brew install caskroom/cask/brew-cask

# Apps
brew cask install alfred
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install backblaze
brew cask install slack
brew cask install spotify
brew cask install iTerm2
brew cask install omnidisksweeper
brew cask install vlc
brew cask install rowanj-gitx
brew cask install karabiner
brew cask install cleanmymac
brew cask install little-snitch
brew cask install skype
brew cask install virtualbox
brew cask install bartender
brew cask install parallels-desktop
brew cask install atom
brew cask install timing
brew cask install cloudapp
brew cask install dash
brew cask install paw
brew cask install zoomus
brew cask install vlc
brew cask install slack
brew cask install sketch
brew cask install skype
brew cask install caffeine
brew cask install docker
brew cask install bartender

# Quick look
brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install webpquicklook

# Link Cask Apps to Alfred
brew cask alfred link

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

# Install libraries
cargo install ripgrep
