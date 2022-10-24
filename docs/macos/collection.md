# General UI/UX



## Set computer name (as done via System Preferences → Sharing)

`sudo scutil --set ComputerName "0x6D746873"`

`sudo scutil --set HostName "0x6D746873"`

`sudo scutil --set LocalHostName "0x6D746873"`

`sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"`

## Disable the sound effects on boot

`sudo nvram SystemAudioVolume=" "`

## Disable transparency in the menu bar and elsewhere on Yosemite

`defaults write com.apple.universalaccess reduceTransparency -bool true`

## Set highlight color to green

`defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"`

## Set sidebar icon size to medium

`defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2`

## Always show scrollbars
## Possible values: `WhenScrolling`, `Automatic` and `Always`

`defaults write NSGlobalDomain AppleShowScrollBars -string "Always"`

## Disable the over-the-top focus ring animation

`defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false`

## Disable smooth scrolling

## (Uncomment if you’re on an older Mac that messes up the animation)

`defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false`

## Increase window resize speed for Cocoa applications

`defaults write NSGlobalDomain NSWindowResizeTime -float 0.001`

## Expand save panel by default

`defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true`
`defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true`

## Expand print panel by default

`defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true`
`defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true`

## Save to disk (not to iCloud) by default

`defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false`

## Automatically quit printer app once the print jobs complete

`defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true`

## Disable the “Are you sure you want to open this application?” dialog

`defaults write com.apple.LaunchServices LSQuarantine -bool false`

## Remove duplicates in the “Open With” menu (also see `lscleanup` alias)

`/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user`

## Display ASCII control characters using caret notation in standard text views

## Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`

`defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true`

## Disable Resume system-wide

`defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false`

## Disable automatic termination of inactive apps

`defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true`

## Disable the crash reporter

`defaults write com.apple.CrashReporter DialogType -string "none"`

## Set Help Viewer windows to non-floating mode

`defaults write com.apple.helpviewer DevMode -bool true`

## Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)

## Commented out, as this is known to cause problems in various Adobe apps :(

## See https://github.com/mathiasbynens/dotfiles/issues/237

`echo "0x08000100:0" > ~/.CFUserTextEncoding `

## Reveal IP address, hostname, OS version, etc. when clicking the clock

## in the login window

`sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName`

## Disable Notification Center and remove the menu bar icon

`launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null`

## Disable automatic capitalization as it’s annoying when typing code

`defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false`

## Disable smart dashes as they’re annoying when typing code

`defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false`

## Disable automatic period substitution as it’s annoying when typing code

`defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false`

## Disable smart quotes as they’re annoying when typing code

`defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false`

## Disable auto-correct

`defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false`

## Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and

## all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.

`rm -rf ~/Library/Application Support/Dock/desktoppicture.db`
`sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg`
`sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg`


# Finder


## Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons

`defaults write com.apple.finder QuitMenuItem -bool true`

## Finder: disable window animations and Get Info animations

`defaults write com.apple.finder DisableAllAnimations -bool true`

## Set Desktop as the default location for new Finder windows

## For other paths, use `PfLo` and `file:///full/path/here/`

`defaults write com.apple.finder NewWindowTarget -string "PfDe"`
`defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"`

## Show icons for hard drives, servers, and removable media on the desktop

`defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true`
`defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true`
`defaults write com.apple.finder ShowMountedServersOnDesktop -bool true`
`defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true`

## Finder: show hidden files by default

`defaults write com.apple.finder AppleShowAllFiles -bool true`

## Finder: show all filename extensions

`defaults write NSGlobalDomain AppleShowAllExtensions -bool true`

## Finder: show status bar

`defaults write com.apple.finder ShowStatusBar -bool true`

## Finder: show path bar

`defaults write com.apple.finder ShowPathbar -bool true`

## Display full POSIX path as Finder window title

`defaults write com.apple.finder _FXShowPosixPathInTitle -bool true`

## Keep folders on top when sorting by name

`defaults write com.apple.finder _FXSortFoldersFirst -bool true`

## When performing a search, search the current folder by default

`defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"`

## Disable the warning when changing a file extension

`defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false`

## Enable spring loading for directories

`defaults write NSGlobalDomain com.apple.springing.enabled -bool true`

## Remove the spring loading delay for directories

`defaults write NSGlobalDomain com.apple.springing.delay -float 0`

## Avoid creating .DS_Store files on network or USB volumes

`defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true`
`defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true`

## Disable disk image verification

`defaults write com.apple.frameworks.diskimages skip-verify -bool true`
`defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true`
`defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true`

## Automatically open a new Finder window when a volume is mounted

`defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true`
`defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true`
`defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true`

## Show item info near icons on the desktop and in other icon views

`/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist`

## Show item info to the right of the icons on the desktop

`/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist`

## Enable snap-to-grid for icons on the desktop and in other icon views

`/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist`

## Increase grid spacing for icons on the desktop and in other icon views

`/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist`

## Increase the size of icons on the desktop and in other icon views

`/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist`
`/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist`

## Use list view in all Finder windows by default

## Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`

`defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"`

## Disable the warning before emptying the Trash

`defaults write com.apple.finder WarnOnEmptyTrash -bool false`

## Enable AirDrop over Ethernet and on unsupported Macs running Lion

`defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true`

## Show the ~/Library folder

`chflags nohidden ~/Library`

## Show the /Volumes folder

`sudo chflags nohidden /Volumes`


## Expand the following File Info panes:

## “General”, “Open with”, and “Sharing & Permissions”

```shell
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true
```

# Finder



## restart Finder

`killall Finder`

## show current Finder settings

`defaults read com.apple.Finder`

## show hidden files

`defaults write com.apple.Finder AppleShowAllFiles YES`

## hide hidden files

`defaults write com.apple.Finder AppleShowAllFiles NO`

## hide file extension

`defaults write NSGlobalDomain AppleShowAllExtensions -bool false`

## show file extension

`defaults write NSGlobalDomain AppleShowAllExtensions -bool true`

## enable timestamp on zip filenames

`defaults write com.apple.Finder ArchiveTimestamp -bool true`

## disable timestamp on zip filenames

`defaults delete com.apple.Finder ArchiveTimestamp`

## turn of empty trash sound

`defaults write com.apple.Finder FinderSounds -bool false`

## turn on empty trash sound

`defaults delete com.apple.Finder FinderSounds`

## folders on top when sorting by name

`defaults write com.apple.Finder _FXSortFoldersFirst -bool true`

## show POSIX path

`defaults write com.apple.Finder _FXShowPosixPathInTitle -bool true`

## show status bar

`defaults write com.apple.Finder ShowStatusBar -bool true`

## show path bar

`defaults write com.apple.Finder ShowPathbar -bool true`

## disable animation when opening the Info window in Finder

`defaults write com.apple.Finder DisableAllAnimations -bool true`

## show internal hard drives on desktop

`defaults write com.apple.Finder ShowHardDrivesOnDesktop -bool true`

## show external hard drives on desktop

`defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -bool true`

## show removable media on desktop

`defaults write com.apple.Finder ShowRemovableMediaOnDesktop -bool true`

## show mounted servers on desktop

`defaults write com.apple.Finder ShowMountedServersOnDesktop -bool true`

## disable the warning before emptying the Trash

`defaults write com.apple.Finder WarnOnEmptyTrash -bool false`


## finder


## Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons

`defaults write com.apple.finder QuitMenuItem -bool true`

## Set Desktop as the default location for new Finder windows

`defaults write com.apple.finder NewWindowTarget -string "PfDe"`
`defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"`

`defaults write com.apple.finder AppleShowAllFiles -bool true`        ## Finder: Show hidden files by default

`defaults write NSGlobalDomain AppleShowAllExtensions -bool true`     ## Finder: Show all filename extensions

`defaults write com.apple.finder ShowStatusBar -bool true`            ## Finder: Show status bar

`defaults write com.apple.finder ShowPathbar -bool true`              ## Finder: Show path bar

`defaults write com.apple.finder _FXShowPosixPathInTitle -bool true`  ## Finder: Display full POSIX path as window title

`defaults write com.apple.finder _FXSortFoldersFirst -bool true`     ## Finder: Keep folders on top when sorting by name

`chflags nohidden ~/Library`     ## Show the ~/Library folder

`sudo chflags nohidden /Volumes` ## Show the /Volumes folder


## Avoid creating .DS_Store files on network or USB volumes

`defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true`
`defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true`

## Automatically open a new Finder window when a volume is mounted

`defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true`
`defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true`
`defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true`

## Use list view in all Finder windows by default (codes for the other view modes: `icnv`, `clmv`, `Flwv`)

`defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"`

## Expand the following File Info panes:

## “General”, “Open with”, and “Sharing & Permissions”

```shell
defaults write com.apple.finder FXInfoPanesExpanded -dict \`
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true
```  


# Dock, Dashboard, and hot corners



## Enable highlight hover effect for the grid view of a stack (Dock)

`defaults write com.apple.dock mouse-over-hilite-stack -bool true`

## Set the icon size of Dock items to 36 pixels

`defaults write com.apple.dock tilesize -int 36`

## Change minimize/maximize window effect

`defaults write com.apple.dock mineffect -string "scale"`

## Minimize windows into their application’s icon

`defaults write com.apple.dock minimize-to-application -bool true`

## Enable spring loading for all Dock items

`defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true`

## Show indicator lights for open applications in the Dock

`defaults write com.apple.dock show-process-indicators -bool true`

## Wipe all (default) app icons from the Dock

## This is only really useful when setting up a new Mac, or if you don’t use the Dock to launch apps.

`defaults write com.apple.dock persistent-apps -array`

## Show only open applications in the Dock

`defaults write com.apple.dock static-only -bool true`

## Don’t animate opening applications from the Dock

`defaults write com.apple.dock launchanim -bool false`

## Speed up Mission Control animations

`defaults write com.apple.dock expose-animation-duration -float 0.1`

## Don’t group windows by application in Mission Control

## (i.e. use the old Exposé behavior instead)

`defaults write com.apple.dock expose-group-by-app -bool false`

## Disable Dashboard

`defaults write com.apple.dashboard mcx-disabled -bool true`

## Don’t show Dashboard as a Space

`defaults write com.apple.dock dashboard-in-overlay -bool true`

## Don’t automatically rearrange Spaces based on most recent use

`defaults write com.apple.dock mru-spaces -bool false`

## Remove the auto-hiding Dock delay

`defaults write com.apple.dock autohide-delay -float 0`

## Remove the animation when hiding/showing the Dock

`defaults write com.apple.dock autohide-time-modifier -float 0`

## Automatically hide and show the Dock

`defaults write com.apple.dock autohide -bool true`

## Make Dock icons of hidden applications translucent

`defaults write com.apple.dock showhidden -bool true`

## Don’t show recent applications in Dock

`defaults write com.apple.dock show-recents -bool false`

## Disable the Launchpad gesture (pinch with thumb and three fingers)

`defaults write com.apple.dock showLaunchpadGestureEnabled -int 0`

## Reset Launchpad, but keep the desktop wallpaper intact

`find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete`

## Add iOS & Watch Simulator to Launchpad

`sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"`
`sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"`

## Add a spacer to the left side of the Dock (where the applications are)

`defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'`

## Add a spacer to the right side of the Dock (where the Trash is)

`defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'`

## Hot corners

Possible values:

0: no-op

2: Mission Control

3: Show application windows

4: Desktop

5: Start screen saver

6: Disable screen saver

7: Dashboard

10: Put display to sleep

11: Launchpad

12: Notification Center

13: Lock Screen

Top left screen corner → Mission Control 

`defaults write com.apple.dock wvous-tl-corner -int 2`
`defaults write com.apple.dock wvous-tl-modifier -int 0`
## Top right screen corner → Desktop

`defaults write com.apple.dock wvous-tr-corner -int 4`
`defaults write com.apple.dock wvous-tr-modifier -int 0`
## Bottom left screen corner → Start screen saver

`defaults write com.apple.dock wvous-bl-corner -int 5`
`defaults write com.apple.dock wvous-bl-modifier -int 0`


# Dock



## restart Dock

`killall Dock`

## reset to factory settings

`defaults delete com.apple.Dock`

## show current dock settings

`defaults read com.apple.Dock`

## add blank space

`defaults write com.apple.Dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'`

## add recent items folder

`defaults write com.apple.Dock persistent-others -array-add '{"tile-data" = {"list-type" = 1;}; "tile-type" = "recents-tile";}' `

## highlights the item under the cursor

`defaults write com.apple.Dock mouse-over-hilite-stack -bool yes`

## show only active Apps

`defaults write com.apple.Dock static-only -bool true`

## active single app mode

`defaults write com.apple.Dock single-app -bool true`

## show hidden apps

`defaults write com.apple.Dock showhidden -bool yes`

## set icon size to 45 pixels

`defaults write com.apple.Dock tilesize -int 45`

## disable auto hide

`defaults write com.apple.Dock autohide -bool false`

## enable auto hide

`defaults write com.apple.Dock autohide -bool true`

## position bottom

`defaults write com.apple.Dock orientation -string bottom`

## position left

`defaults write com.apple.Dock orientation -string left`

## position right

`defaults write com.apple.Dock orientation -string right`

## show wallpaper location

`defaults write com.apple.Dock desktop-picture-show-debug-text -bool true`

## don't show wallpaper location

`defaults delete com.apple.Dock desktop-picture-show-debug-text`

## disable animations when you open an application from the Dock

`defaults write com.apple.Dock launchanim -bool false`

## disable delay when you hide the Dock

`defaults write com.apple.Dock autohide-delay -float 0`

## set speed for Mission Control (fast)
`defaults write com.apple.Dock expose-animation-duration -float 0.1`


# Dashboard



## restart Dashboard

`killall Dock`

## show current Dashboard settings

``defaults read com.apple.Dashboard``

## disable dashboard

``defaults write com.apple.Dashboard mcx-disabled -boolean true``

## enable dashboard

``defaults write com.apple.Dashboard mcx-disabled -boolean false``



# Safari & WebKit



## Privacy: don’t send search queries to Apple

`defaults write com.apple.Safari UniversalSearchEnabled -bool false`
`defaults write com.apple.Safari SuppressSearchSuggestions -bool true`

## Press Tab to highlight each item on a web page

`defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true`
`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true`

## Show the full URL in the address bar (note: this still hides the scheme)

`defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true`

## Set Safari’s home page to `about:blank` for faster loading

`defaults write com.apple.Safari HomePage -string "about:blank"`

## Prevent Safari from opening ‘safe’ files automatically after downloading

`defaults write com.apple.Safari AutoOpenSafeDownloads -bool false`

## Allow hitting the Backspace key to go to the previous page in history

`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true`

## Hide Safari’s bookmarks bar by default

`defaults write com.apple.Safari ShowFavoritesBar -bool false`

## Hide Safari’s sidebar in Top Sites

`defaults write com.apple.Safari ShowSidebarInTopSites -bool false`

## Disable Safari’s thumbnail cache for History and Top Sites

`defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2`

## Enable Safari’s debug menu

`defaults write com.apple.Safari IncludeInternalDebugMenu -bool true`

## Make Safari’s search banners default to Contains instead of Starts With

`defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false`

## Remove useless icons from Safari’s bookmarks bar

`defaults write com.apple.Safari ProxiesInBookmarksBar "()"`

## Enable the Develop menu and the Web Inspector in Safari

`defaults write com.apple.Safari IncludeDevelopMenu -bool true`
`defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true`
`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true`

## Add a context menu item for showing the Web Inspector in web views

`defaults write NSGlobalDomain WebKitDeveloperExtras -bool true`

## Enable continuous spellchecking

`defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true`

## Disable auto-correct

`defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false`

## Disable AutoFill

`defaults write com.apple.Safari AutoFillFromAddressBook -bool false`
`defaults write com.apple.Safari AutoFillPasswords -bool false`
`defaults write com.apple.Safari AutoFillCreditCardData -bool false`
`defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false`

## Warn about fraudulent websites

`defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true`

## Disable plug-ins

`defaults write com.apple.Safari WebKitPluginsEnabled -bool false`
`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false`

## Disable Java

`defaults write com.apple.Safari WebKitJavaEnabled -bool false`
`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false`
`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false`

## Block pop-up windows

`defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false`
`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false`

## Disable auto-playing video

`defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false`
`defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false`
`defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false`
`defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false`

## Enable “Do Not Track”

`defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true`

## Update extensions automatically

`defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true`


# Safari



## show current safari settings

`defaults read com.apple.Safari`

## disable safari auto open files

`defaults write com.apple.Safari AutoOpenSafeDownloads -bool false`

## enable safari auto open files

`defaults write com.apple.Safari AutoOpenSafeDownloads -bool true`

## hide bookmarks bar

`defaults write com.apple.Safari ShowFavoritesBar -bool false`

## show bookmarks bar

`defaults write com.apple.Safari ShowFavoritesBar -bool true`

## hide developer menu

`defaults write com.apple.Safari IncludeDevelopMenu -bool false`

## show developer menu

`defaults write com.apple.Safari IncludeDevelopMenu -bool true`

## enable tab memory

`defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool true`

## disable tab memory

`defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -bool false`


# Spotlight



## Hide Spotlight tray-icon (and subsequent helper)

`sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search`

## Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before.

## Use ``sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.`

`sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"`

## Change indexing order and disable some search results

## Yosemite-specific search results (remove them if you are using macOS 10.9 or older):

## 	MENU_DEFINITION

## 	MENU_CONVERSION

## 	MENU_EXPRESSION

## 	MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)

## 	MENU_WEBSEARCH             (send search queries to Apple)

## 	MENU_OTHER

```shell
defaults write com.apple.spotlight orderedItems -array \`
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

```
## Load new settings before rebuilding the index

`killall mds > /dev/null 2>&1`

## Make sure indexing is enabled for the main volume

`sudo mdutil -i on / > /dev/null`

## Rebuild the index from scratch

`sudo mdutil -E / > /dev/null`



# Spotlight



## show current spotlight settings

`defaults read com.apple.Spotlight`



# Terminal & iTerm 2



## Only use UTF-8 in Terminal.app

`defaults write com.apple.terminal StringEncodings -array 4`

## Use a modified version of the Solarized Dark theme by default in Terminal.app

```shell

osascript <<EOD

tell application "Terminal"

	local allOpenedWindows
	local initialOpenedWindows
	local windowID
	set themeName to "Solarized Dark xterm-256color"

	(* Store the IDs of all the open terminal windows. *)
	set initialOpenedWindows to id of every window

	(* Open the custom theme so that it gets added to the list
	   of available terminal themes (note: this will open two
	   additional terminal windows). *)
	do shell script "open '$HOME/init/" & themeName & ".terminal'"

	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1

	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName

	(* Get the IDs of all the currently opened terminal windows. *)
	set allOpenedWindows to id of every window

	repeat with windowID in allOpenedWindows

		(* Close the additional windows that were opened in order
		   to add the custom theme to the list of terminal themes. *)
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)

		(* Change the theme for the initial opened terminal windows
		   to remove the need to close them in order for the custom
		   theme to be applied. *)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if

	end repeat

end tell

EOD
```

## Enable “focus follows mouse” for Terminal.app and all X11 apps

## i.e. hover over a window and start typing in it without clicking first

`defaults write com.apple.terminal FocusFollowsMouse -bool true`
`defaults write org.x.X11 wm_ffm -bool true`

## Enable Secure Keyboard Entry in Terminal.app

## See: https://security.stackexchange.com/a/47786/8918

`defaults write com.apple.terminal SecureKeyboardEntry -bool true`

## Disable the annoying line marks

`defaults write com.apple.Terminal ShowLineMarks -int 0`

## Install the Solarized Dark theme for iTerm

`open "${HOME}/init/Solarized Dark.itermcolors`

## Don’t display the annoying prompt when quitting iTerm

`defaults write com.googlecode.iterm2 PromptOnQuit -bool false`


# Terminal



## show current terminal settings

`defaults read com.apple.Terminal`

## disable line marks

`defaults write com.apple.Terminal ShowLineMarks -int 0`

## use UTF-8 only

`defaults write com.apple.Terminal StringEncodings -array 4`


# Mac App Store


## Enable the WebKit Developer Tools in the Mac App Store

`defaults write com.apple.appstore WebKitDeveloperExtras -bool true`

## Enable Debug Menu in the Mac App Store

`defaults write com.apple.appstore ShowDebugMenu -bool true`

## Enable the automatic update check

`defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true`

## Check for software updates daily, not just once per week

`defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1`

## Download newly available updates in background

`defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1`

## Install System data files & security updates

`defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1`

## Automatically download apps purchased on other Macs

`defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1`

## Turn on app auto-update

`defaults write com.apple.commerce AutoUpdate -bool true`

## Allow the App Store to reboot machine on macOS updates

`defaults write com.apple.commerce AutoUpdateRestartRequired -bool true`


# Photos



## Prevent Photos from opening automatically when devices are plugged in

`defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true`

# Messages


## Disable automatic emoji substitution (i.e. use plain text smileys)

`defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false`

## Disable smart quotes as it’s annoying for messages that contain code

`defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false `

## Disable continuous spell checking

`defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false`


# Google Chrome & Google Chrome Canary

## Disable the all too sensitive backswipe on trackpads

`defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false`
`defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false`

## Disable the all too sensitive backswipe on Magic Mouse

`defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false`
`defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false`

## Use the system-native print preview dialog

`defaults write com.google.Chrome DisablePrintPreview -bool true`
`defaults write com.google.Chrome.canary DisablePrintPreview -bool true`

## Expand the print dialog by default

`defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true`
`defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true`




# Enable/Disable features


## disable autocorrect

`defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false`

## enable autocorrect

`defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true`

## disable .DS_Store

`defaults write com.apple.desktopservices DSDontWriteNetworkStores true`

## enable .DS_Store

`defaults write com.apple.desktopservices DSDontWriteNetworkStores false`

## disable crash reporter

`defaults write com.apple.CrashReporter DialogType none`

## disable save into iCloud

`defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false`

## disable rubber-band scrolling

`defaults write -g NSScrollViewRubberbanding -int 0`

## enable rubber-band scrolling

`defaults delete -g NSScrollViewRubberbanding`

## enable AirDrop for ethernet

`defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true`

## expand save dialog

`defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true`

## expand print dialog

`defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true`

## disable animations when opening and closing windows

`defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false`

## disable animations when opening a Quick Look window

`defaults write -g QLPanelAnimationDuration -float 0`


# Trackpad, mouse, keyboard, Bluetooth accessories, and input


## Trackpad: enable tap to click for this user and for the login screen

`defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true`
`defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1`
`defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1`

## Trackpad: map bottom right corner to right-click

`defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2`
`defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true`
`defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1`
`defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true`

## Disable “natural” (Lion-style) scrolling

`defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false`

## Increase sound quality for Bluetooth headphones/headsets

`defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40`

## Enable full keyboard access for all controls
## (e.g. enable Tab in modal dialogs)

`defaults write NSGlobalDomain AppleKeyboardUIMode -int 3`

## Use scroll gesture with the Ctrl (^) modifier key to zoom

`defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true`
`defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144`

## Follow the keyboard focus while zoomed in

`defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true`

## Disable press-and-hold for keys in favor of key repeat

`defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false`

## Set a blazingly fast keyboard repeat rate

`defaults write NSGlobalDomain KeyRepeat -int 1`
`defaults write NSGlobalDomain InitialKeyRepeat -int 10`

## Set language and text formats

## Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with

## `Inches`, `en_GB` with `en_US`, and `true` with `false`.

`defaults write NSGlobalDomain AppleLanguages -array "en" "nl"`
`defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"`
`defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"`
`defaults write NSGlobalDomain AppleMetricUnits -bool true`

## Show language menu in the top right corner of the boot screen

`sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true`

## Set the timezone; see ``sudo systemsetup -listtimezones` for other values`

`sudo systemsetup -settimezone "Europe/Brussels" > /dev/null`

## Stop iTunes from responding to the keyboard media keys

`launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null`


# Energy saving



## Enable lid wakeup

`sudo pmset -a lidwake 1`

## Restart automatically on power loss

`sudo pmset -a autorestart 1`

## Restart automatically if the computer freezes

`sudo systemsetup -setrestartfreeze on`

## Sleep the display after 15 minutes

`sudo pmset -a displaysleep 15`

## Disable machine sleep while charging

`sudo pmset -c sleep 0`

## Set machine sleep to 5 minutes on battery

`sudo pmset -b sleep 5`

## Set standby delay to 24 hours (default is 1 hour)

`sudo pmset -a standbydelay 86400`

## Never go into computer sleep mode

`sudo systemsetup -setcomputersleep Off > /dev/null`

## Hibernation mode

## 0: Disable hibernation (speeds up entering sleep mode)

## 3: Copy RAM to disk so the system state can still be restored in case of a power failure.

`sudo pmset -a hibernatemode 0`

## Remove the sleep image file to save disk space

`sudo rm /private/var/vm/sleepimage`

## Create a zero-byte file instead…

`sudo touch /private/var/vm/sleepimage`

## …and make sure it can’t be rewritten

`sudo chflags uchg /private/var/vm/sleepimage`


# Screen 



## Require password immediately after sleep or screen saver begins

`defaults write com.apple.screensaver askForPassword -int 1`
`defaults write com.apple.screensaver askForPasswordDelay -int 0`

## Save screenshots to the desktop

`defaults write com.apple.screencapture location -string "${HOME}/Desktop"`

## Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)

`defaults write com.apple.screencapture type -string "png"`

## Disable shadow in screenshots

`defaults write com.apple.screencapture disable-shadow -bool true`

## Enable subpixel font rendering on non-Apple LCDs

## Reference: https://github.com/kevinSuttle/macOS-`Defaults/issues/17##issuecomment-266633501`

`defaults write NSGlobalDomain AppleFontSmoothing -int 1`

## Enable HiDPI display modes (requires restart)

`sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true`


# QuickTime



## show current QuickTime settings

`defaults read com.apple.QuickTimePlayerX`

## diable rounded corners

`defaults write com.apple.QuickTimePlayerX MGCinematicWindowDebugForceNoRoundedCorners -bool true`

## enable rounded corners

`defaults delete com.apple.QuickTimePlayerX MGCinematicWindowDebugForceNoRoundedCorners`

## enable autostart movies

`defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true`

## disable autostart movies

`defaults delete com.apple.QuickTimePlayerX MGPlayMovieOnOpen`

## disable controller bar

`defaults write com.apple.QuickTimePlayerX MGUIVisibilityNeverAutoshow -bool true`

## enable controller bar

`defaults delete com.apple.QuickTimePlayerX MGUIVisibilityNeverAutoshow`

## enable auto show subtitles

`defaults write com.apple.QuickTimePlayerX MGEnableCCAndSubtitlesOnOpen -bool true`

## disable auto show subtitles

`defaults delete com.apple.QuickTimePlayerX MGEnableCCAndSubtitlesOnOpen`


# Mail


## Disable send and reply animations in Mail.app

`defaults write com.apple.mail DisableReplyAnimations -bool true`
`defaults write com.apple.mail DisableSendAnimations -bool true`

## Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app

`defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false`

## Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app

`defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"`

## Display emails in threaded mode, sorted by date (oldest at the top)

`defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"`
`defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"`
`defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"`

## Disable inline attachments (just show the icons)

`defaults write com.apple.mail DisableInlineAttachmentViewing -bool true`

## Disable automatic spell checking

`defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"`


# Time Machine



## Prevent Time Machine from prompting to use new hard drives as backup volume

`defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true`

## Disable local Time Machine backups

`hash tmutil &> /dev/null && sudo tmutil disablelocal`


# Activity Monitor


## Show the main window when launching Activity Monitor

`defaults write com.apple.ActivityMonitor OpenMainWindow -bool true`

## Visualize CPU usage in the Activity Monitor Dock icon

`defaults write com.apple.ActivityMonitor IconType -int 5`

## Show all processes in Activity Monitor

`defaults write com.apple.ActivityMonitor ShowCategory -int 0`

## Sort Activity Monitor results by CPU usage

`defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"`
`defaults write com.apple.ActivityMonitor SortDirection -int 0`


# Address Book, Dashboard, iCal, TextEdit, and Disk Utility


## Enable the debug menu in Address Book

`defaults write com.apple.addressbook ABShowDebugMenu -bool true`

## Enable Dashboard dev mode (allows keeping widgets on the desktop)

`defaults write com.apple.dashboard devmode -bool true`

## Enable the debug menu in iCal (pre-10.8)

`defaults write com.apple.iCal IncludeDebugMenu -bool true`

## Use plain text mode for new TextEdit documents

`defaults write com.apple.TextEdit RichText -int 0`

## Open and save files as UTF-8 in TextEdit

`defaults write com.apple.TextEdit PlainTextEncoding -int 4`
`defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4`

## Enable the debug menu in Disk Utility

`defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true`
`defaults write com.apple.DiskUtility advanced-image-options -bool true`

## Auto-play videos when opened with QuickTime Player

`defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true`


# Kill affected applications



```shell
for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
```