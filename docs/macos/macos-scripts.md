# macOS Scripts

## Installomator

source: [Installomator/Installomator](https://github.com/Installomator/Installomator)

```bash
curl -OL https://github.com/Installomator/Installomator/raw/main/Installomator.sh && sudo ./Installomator.sh microsoftofficebusinesspro DEBUG=0
```

## setup.sh 

source: [bradp/setup.sh](https://gist.github.com/bradp/bea76b16d3325f5c47d4)

```bash
echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "Brad Parbs"
git config --global user.email brad@bradparbs.com


echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install svn
brew install mackup
brew install node


#@TODO install our custom fonts and stuff

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

echo "Copying dotfiles from Github"
cd ~
git clone git@github.com:bradp/dotfiles.git .dotfiles
cd .dotfiles
sh symdotfiles

echo "Grunting it up"
npm install -g grunt-cli

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Oh My Zsh theme..."
cd  /Users/bradparbs/.oh-my-zsh/themes
curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > brad-muse.zsh-theme

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

# Apps
apps=(
  alfred
  bartender
  bettertouchtool
  cleanmymac
  cloud
  colloquy
  cornerstone
  diffmerge
  dropbox
  filezilla
  firefox
  google-chrome
  harvest
  hipchat
  licecap
  mou
  phpstorm
  private-internet-access
  razer-synapse
  sourcetree
  steam
  spotify
  vagrant
  iterm2
  sublime-text2
  textexpander
  virtualbox
  mailbox
  vlc
  skype
  transmission
  zoomus
  onepassword
  sequel-pro
  chromecast
  qlmarkdown
  qlstephen
  suspicious-package
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask cleanup
brew cleanup

echo "Please setup and sync Dropbox, and then run this script again."
read -p "Press [Enter] key after this..."

echo "Restoring setup from Mackup..."
#mackup restore @TODO uncomment


echo "Setting some Mac settings..."

#"Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#"Disable smart quotes and smart dashes as they are annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#"Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

#"Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

#"Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Disable the sudden motion sensor as its not useful for SSDs"
sudo pmset -a sms 0

#"Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

#"Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

#"Setting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

#"Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

#"Hiding Safari's sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

#"Disabling Safari's thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#"Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#"Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

#"Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#"Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

#"Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

#"Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#"Use `~/Downloads/Incomplete` to store incomplete downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

#"Don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

#"Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

#"Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

#"Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

#"Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false



killall Finder


echo "Done!"
```

## RenameMacUserNameAndHomeDirectory

source [TheJumpCloud/support](https://github.com/TheJumpCloud/support/blob/master/scripts/macos/RenameMacUserNameAndHomeDirectory.sh)

```bash
#!/bin/bash
###############################################################################
# Version 1.3
#
# RenameMacUserNameAndHomeDirectory.sh - Script to rename the username of a
# user account on MacOS. The script updates the users record name (username),
# and home directory.  If the user receiving the name change is signed in
# they will be signed out.
#
# Example usage: sudo sh RenameMacUserNameAndHomeDirectory.sh cat dog
#
# Above example would rename account cat to dog
#
# NOTE: SCRIPT MUST BE RUN AS ROOT
# NOTE: TERMINAL MUST BE GRANTED FULL DISK ACCESS TO RUN SUCCESSFULLY
# NOTE: SYSTEM WILL RESTART AFTER SCRIPT IS RUN
#
# Questions or issues with the operation of the script, please contact
# support@jumpcloud.com
###############################################################################

# Logging file created in same directory as this script
d=$(date +%Y-%m-%d--%I:%M:%S)
log="${d} JC_RENAME:"

# Create the log file
touch JC_RENAME.log
# Open permissions to account for all error catching
chmod 777 JC_RENAME.log

# Begin Logging
echo "${log} ## Rename Script Begin ##" 2>&1 | tee -a JC_RENAME.log

# Ensures that script is run as ROOT
if [[ "${UID}" != 0 ]]; then
  echo "${log} Error: $0 script must be run as root" 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Ensure Terminal has been granted Full Disk Access
sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db 'SELECT * from access'
# accessStatus=(${access} | grep "unable")
if [[ $? -ne 0 ]]; then
  echo "${log} Error: Terminal does not appear to have the correct access!" 2>&1 | tee -a JC_RENAME.log
  echo "${log} Grant terminal Full Disk Access and try again." 2>&1 | tee -a JC_RENAME.log
  exit 1
fi
# Ensures that the system is not domain bound
readonly domainBoundCheck=$(dsconfigad -show)
if [[ "${domainBoundCheck}" ]]; then
  echo "${log} Error: Cannot run on domain bound system. Unbind system and try again." 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

oldUser=$1
newUser=$2

# Ensures that parameters are entered
if [[ ${#} -ne 2 ]]; then
  echo "${log} Error: $0 requires two parameters $oldUserName $newUserName" 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Test to ensure logged in user is not being renamed
readonly loggedInUser=$(ls -la /dev/console | cut -d " " -f 4)
if [[ "${loggedInUser}" == "${oldUser}" ]]; then
  echo "${log} Error: Cannot rename active GUI logged in user. Log in with another admin account and try again." 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Verify valid usernames
if [[ -z "${newUser}" ]]; then
  echo "${log} Error: New user name must not be empty!" 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Test to ensure account update is needed
if [[ "${oldUser}" == "${newUser}" ]]; then
  echo "${log} Error: Account ${oldUser}" is the same name "${newUser}" 2>&1 | tee -a JC_RENAME.log
  exit 0
fi

# Query existing user accounts
readonly existingUsers=($(dscl . -list /Users | grep -Ev "^_|com\..*|root|nobody|daemon|\/" | cut -d, -f1 | sed 's|CN=||g'))

# Ensure old user account is correct and account exists on system
if [[ ! " ${existingUsers[@]} " =~ " ${oldUser} " ]]; then
  echo "${log} Error: ${oldUser} account not present on system to update" 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Ensure new user account is not already in use
if [[ " ${existingUsers[@]} " =~ " ${newUser} " ]]; then
  echo "${log} Error: ${newUser} account already present on system. Cannot add duplicate" 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Query existing home folders
readonly existingHomeFolders=($(ls /Users))

# Ensure existing home folder is not in use
if [[ " ${existingHomeFolders[@]} " =~ " ${newUser} " ]]; then
  echo "${log} Error: ${newUser} home folder already in use on system. Cannot add duplicate" 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Check if username differs from home directory name
actual=$(eval echo "~${oldUser}")
if [[ "/Users/${oldUser}" != "$actual" ]]; then
  echo "${log} Error: Username differs from home directory name!" 2>&1 | tee -a JC_RENAME.log
  echo "${log} Error: home directory: ${actual} should be: /Users/${oldUser}, aborting." 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Checks if user is logged in
loginCheck=$(ps -Ajc | grep -w ${oldUser} | grep loginwindow | awk '{print $2}')

# Logs out user if they are logged in
timeoutCounter='0'
while [[ "${loginCheck}" ]]; do
  echo "${log} Notice: ${oldUser} account logged in. Logging user off to complete username update" 2>&1 | tee -a JC_RENAME.log
  sudo launchctl bootout gui/$(id -u ${oldUser})
  Sleep 5
  loginCheck=$(ps -Ajc | grep -w ${oldUser} | grep loginwindow | awk '{print $2}')
  timeoutCounter=$((${timeoutCounter} + 1))
  if [[ ${timeoutCounter} -eq 4 ]]; then
    echo "${log} Error: Timeout unable to log out ${oldUser} account" 2>&1 | tee -a JC_RENAME.log
    exit 1
  fi
done

# Captures current NFS home directory
readonly origHomeDir=$(dscl . -read "/Users/${oldUser}" NFSHomeDirectory | awk '{print $2}' -)

if [[ -z "${origHomeDir}" ]]; then
  echo "${log} Error: Cannot obtain the original home directory name, is the ${oldUser} name correct?" 2>&1 | tee -a JC_RENAME.log
  exit 1
fi

# Updates NFS home directory
sudo dscl . -change "/Users/${oldUser}" NFSHomeDirectory "${origHomeDir}" "/Users/${newUser}"

if [[ $? -ne 0 ]]; then
  echo "${log} Error: Could not rename the user's home directory pointer, aborting further changes! - err=$?" 2>&1 | tee -a JC_RENAME.log
  echo "${log} Notice: Reverting Home Directory changes" 2>&1 | tee -a JC_RENAME.log
  sudo dscl . -change "/Users/${oldUser}" NFSHomeDirectory "/Users/${newUser}" "${origHomeDir}"
  exit 1
fi

# Updates name of home directory to new username
mv "${origHomeDir}" "/Users/${newUser}"

if [[ $? -ne 0 ]]; then
  echo "${log} Error: Could not rename the user's home directory in /Users" 2>&1 | tee -a JC_RENAME.log
  echo "${log} Notice: Reverting Home Directory changes" 2>&1 | tee -a JC_RENAME.log
  mv "/Users/${newUser}" "${origHomeDir}"
  sudo dscl . -change "/Users/${oldUser}" NFSHomeDirectory "/Users/${newUser}" "${origHomeDir}"
  exit 1
fi

# Actual username change
sudo dscl . -change "/Users/${oldUser}" RecordName "${oldUser}" "${newUser}"

if [[ $? -ne 0 ]]; then
  echo "${log} Error: Could not rename the user's RecordName in dscl - the user should still be able to login, but with user name ${oldUser}" 2>&1 | tee -a JC_RENAME.log
  echo "${log} Notice: Reverting username change" 2>&1 | tee -a JC_RENAME.log
  sudo dscl . -change "/Users/${oldUser}" RecordName "${newUser}" "${oldUser}"
  echo "${log} Notice: Reverting Home Directory changes" 2>&1 | tee -a JC_RENAME.log
  mv "/Users/${newUser}" "${origHomeDir}"
  sudo dscl . -change "/Users/${oldUser}" NFSHomeDirectory "/Users/${newUser}" "${origHomeDir}"
  exit 1
fi

# Links old home directory to new. Fixes dock mapping issue
ln -s "/Users/${newUser}" "${origHomeDir}"

# Success message
read -r -d '' successOutput <<EOM
${log} Success ${oldUser} username has been updated to ${newUser}
${log} Folder "${origHomeDir}" has been renamed to "/Users/${newUser}"
${log} RecordName: ${newUser}
${log} NFSHomeDirectory: "/Users/${newUser}"
${log} SYSTEM RESTARTING in 5 seconds to complete username update.
EOM

echo "${successOutput}" 2>&1 | tee -a JC_RENAME.log

# System restart
Sleep 5
osascript -e 'tell application "System Events" to restart'
exit 0
```

## Defaults

source [pathikrit/mac-setup-script](https://github.com/pathikrit/mac-setup-script)

```bash
#!/usr/bin/env bash

# Adapted from https://github.com/mathiasbynens/dotfiles/blob/master/.macos

set -x

if [[ -z "${CI}" ]]; then
  sudo -v # Ask for the administrator password upfront
  # Keep-alive: update existing `sudo` time stamp until script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable auto corrections
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false    # Disable smart dashes
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false  # Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false   # Disable smart quotes
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false  # Disable auto-correct

# Enable full keyboard access for all controls e.g. enable Tab in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Set Desktop as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

defaults write com.apple.finder AppleShowAllFiles -bool true        # Finder: Show hidden files by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true     # Finder: Show all filename extensions
defaults write com.apple.finder ShowStatusBar -bool true            # Finder: Show status bar
defaults write com.apple.finder ShowPathbar -bool true              # Finder: Show path bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true  # Finder: Display full POSIX path as window title
defaults write com.apple.finder _FXSortFoldersFirst -bool true      # Finder: Keep folders on top when sorting by name
chflags nohidden ~/Library     # Show the ~/Library folder
sudo chflags nohidden /Volumes # Show the /Volumes folder

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all Finder windows by default (codes for the other view modes: `icnv`, `clmv`, `Flwv`)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
```
      
## Defaults_luc

```bash
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
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

```

## Download and Install Microsoft products

source [talkingmoose/Download and Install Microsoft product.zsh](https://gist.github.com/talkingmoose/a16ca849416ce5ce89316bacd75fc91a)

```bash
#!/bin/zsh

:<<'ABOUT_THIS_SCRIPT'
-----------------------------------------------------------------------

	Written by:William Smith
	Professional Services Engineer
	Jamf
	bill@talkingmoose.net
	https://gist.github.com/talkingmoose/a16ca849416ce5ce89316bacd75fc91a
	
	Originally posted: November 19, 2017
	Updated: January 20, 2020

	Purpose: Downloads and installs the latest available Microsoft
	product specified directly on the client. This avoids having to
	manually download and store an up-to-date installer on a
	distribution server every month.
	
	Instructions: Update the linkID value to one of the corresponding
	Microsoft products in the list and optionally update the sha256Checksum
	value with a known SHA 256 string. Run the script with elevated
	privileges. If using Jamf Pro, consider replacing the linkID and
	sha256Checksum values with "$4" and "$5", entering the ID as script
	parameters in a policy.

	Except where otherwise noted, this work is licensed under
	http://creativecommons.org/licenses/by/4.0/

	"You say goodbye and I say exit 0."
	
-----------------------------------------------------------------------
ABOUT_THIS_SCRIPT

# enter the Microsoft fwlink (permalink) product ID
# or leave blank if using a $4 script parameter with Jamf Pro

linkID="" # e.g. "525133" for Office 2019

# 525133 - Office 2019 for Mac SKUless download (aka Office 365)
# 2009112 - Office 2019 for Mac BusinessPro SKUless download (aka Office 365 with Teams)
# 871743 - Office 2016 for Mac SKUless download
# 830196 - AutoUpdate download
# 2069148 - Edge (Consumer Stable)
# 2069439 - Edge (Consumer Beta)
# 2069340 - Edge (Consumer Dev)
# 2069147 - Edge (Consumer Canary)
# 2093438 - Edge (Enterprise Stable)
# 2093294 - Edge (Enterprise Beta)
# 2093292 - Edge (Enterprise Dev)
# 525135 - Excel 2019 SKUless download
# 871750 - Excel 2016 SKUless download
# 869655 - InTune Company Portal download
# 823060 - OneDrive download
# 820886 - OneNote download
# 525137 - Outlook 2019 SKUless download
# 871753 - Outlook 2016 SKUless download
# 525136 - PowerPoint 2019 SKUless download
# 871751 - PowerPoint 2016 SKUless download
# 868963 - Remote Desktop
# 800050 - SharePoint Plugin download
# 832978 - Skype for Business download
# 869428 - Teams
# 525134 - Word 2019 SKUless download
# 871748 - Word 2016 SKUless download

# enter the SHA 256 checksum for the download file
# download the package and run '/usr/bin/shasum -a 256 /path/to/file.pkg'
# this will change with each version
# leave blank to to skip the checksum verification (less secure) or if using a $5 script parameter with Jamf Pro

sha256Checksum="" # e.g. "67b1e8e036c575782b1c9188dd48fa94d9eabcb81947c8632fd4acac7b01644b"

if [ "$4" != "" ] && [ "$linkID" = "" ]
then
    linkID=$4
fi

if [ "$5" != "" ] && [ "$sha256Checksum" = "" ]
then
    sha256Checksum=$5
fi

# this is the full fwlink URL
url="https://go.microsoft.com/fwlink/?linkid=$linkID"

# create temporary working directory
echo "Creating working directory '$tempDirectory'"
workDirectory=$( /usr/bin/basename $0 )
tempDirectory=$( /usr/bin/mktemp -d "/private/tmp/$workDirectory.XXXXXX" )

# change directory to temporary working directory
echo "Changing directory to working directory '$tempDirectory'"
cd "$tempDirectory"

# download the installer package and name it for the linkID
echo "Downloading package $linkID.pkg"
/usr/bin/curl --location --silent "$url" -o "$linkID.pkg"

# checksum the download
downloadChecksum=$( /usr/bin/shasum -a 256 "$tempDirectory/$linkID.pkg" | /usr/bin/awk '{ print $1 }' )
echo "Checksum for downloaded package: $downloadChecksum"

# install the package if checksum validates
if [ "$sha256Checksum" = "$downloadChecksum" ] || [ "$sha256Checksum" = "" ]; then
	echo "Checksum verified. Installing package $linkID.pkg"
	/usr/sbin/installer -pkg "$linkID.pkg" -target /
	exitCode=0
else
	echo "Checksum failed. Recalculate the SHA 256 checksum and try again. Or download may not be valid."
	exitCode=1
fi

# remove the temporary working directory when done
/bin/rm -Rf "$tempDirectory"
echo "Deleting working directory '$tempDirectory' and its contents"

exit $exitCode
```

## Install Office 365 script


```bash
/usr/bin/curl --location --silent "https://go.microsoft.com/fwlink/?linkid=2009112" -o "O365BusinessPro.pkg" && /usr/sbin/installer -pkg "O365BusinessPro.pkg" -target /
```
