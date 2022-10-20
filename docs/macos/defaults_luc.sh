#!/bin/env bash

# Finder: Show hidden files by default
echo "Finder: show hidden files"
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: Show all filename extensions
echo "Finder: show file extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: Show status bar
echo "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: Show path bar
echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Keep folders on top when sorting by name
echo "Keep folders on top when sorting by name"
defaults write com.apple.Finder _FXSortFoldersFirst -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
echo "Enable admin info for login screen clock"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Enabling snap-to-grid for icons on the desktop and in other icon views
echo "Enabling snap-to-grid for icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Change the Rows and Columns of Launchpad
echo "set launchpad to 6 rows and 8 columns"
defaults write com.apple.dock springboard-rows -int 6
defaults write com.apple.dock springboard-columns -int 8
defaults write com.apple.dock ResetLaunchPad -bool TRUE
killall Dock

# Install xcode
echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "technoluc"
git config --global user.email luc@technoluc.nl

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

# Apps
apps=(
	alfred
        alt-tab
        bartender
        bettertouchtool
        cleanmymac
        cyberduck
        devtoys
        fig
        google-chrome
        iterm2
        mas
        raycast
        spotify
        suspicious-package
        thefuck
	      visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask cleanup
brew cleanup

# Allow text selection in Quick Look
echo "Enable text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)
echo "enable full keyboard access for controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3