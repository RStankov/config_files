#!/bin/bash

# Tools
brew install wget
brew install zsh
brew install git
brew install macvim
brew install ruby-build
brew install rbenv
brew install node
brew install imagemagick
brew install phantomjs
brew install the_silver_searcher
brew install ctags
brew install redis
brew install tree

# Cask
brew install caskroom/cask/brew-cask

# Apps
brew cask install alfred
brew cask install fantastical
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install backblaze
brew cask install slack
brew cask install transmission
brew cask install spotify
brew cask install iTerm2
brew cask install omnidisksweeper
brew cask install vlc
brew cask install gitx-l
brew cask install karabiner
brew cask install cleanmymac
brew cask install postgres
brew cask install little-snitch
brew cask install skype
brew cask install virtualbox

# Quick look
brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install webp-quicklook

# Link Cask Apps to Alfred
brew cask alfred link

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
