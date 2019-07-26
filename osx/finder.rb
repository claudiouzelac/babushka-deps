dep 'allow-quit-in-finder' do
    shell('defaults write com.apple.finder QuitMenuItem -bool false')
end
  
dep 'limit-search-scope-to-finder-location' do
    shell('defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"')
end
  
dep 'show-folder-path-in-finder' do
    shell('defaults write com.apple.finder ShowPathbar -bool true')
    shell('defaults write com.apple.finder _FXShowPosixPathInTitle -bool true')
end
  
dep 'open-finder-on-new-mounts' do
    shell('defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true')
    shell('defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true')
    shell('defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true')
end
  
dep 'show-mounts-on-desktop' do
    shell('defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true')
    shell('defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true')
    shell('defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true')
    shell('defaults write com.apple.finder ShowMountedServersOnDesktop -bool true')
end
  
dep 'show-hard-drives-on-desktop' do
    shell('defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true')
end
  
dep 'disable-warn-on-trash-empty' do
    shell('defaults write com.apple.finder WarnOnEmptyTrash -bool false')
end
  
dep 'show-all-files-in-folder' do
    shell('defaults write com.apple.Finder AppleShowAllFiles YES')
end

dep 'show-hidden-files' do
  shell('defaults write com.apple.finder AppleShowAllFiles -bool true')
  shell('chflags nohidden ~/Library')
end
  
dep 'disable-warns-on-file-extension-changes' do
    shell('defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false')
end
  
dep 'securely-empty-trash' do
    shell('defaults write com.apple.finder EmptyTrashSecurely -bool true')
end
  
dep 'avoid-ds-store-creation-on-nextwork-volumes' do
    shell('defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true')
end
  
dep 'open-on-home-directory' do
    shell('defaults write com.apple.finder NewWindowTarget PfHm')
end
  
dep 'prefer-list-view' do
    shell('defaults write com.apple.finder FXPreferredViewStyle Nlsv')
end
  
dep('show-all-filename-extensions') {
    shell('defaults write NSGlobalDomain AppleShowAllExtensions -bool true')
}
  
dep('disable-all-animations') {
    shell('defaults write com.apple.finder DisableAllAnimations -bool true')
}
  
dep('configure_finder') {
    requires %w(
                allow-quit-in-finder
                limit-search-scope-to-finder-location
                show-folder-path-in-finder
                open-finder-on-new-mounts
                show-mounts-on-desktop
                show-hard-drives-on-desktop
                disable-warn-on-trash-empty
                show-all-files-in-folder
                disable-warns-on-file-extension-changes
                securely-empty-trash
                avoid-ds-store-creation-on-nextwork-volumes
                open-on-home-directory
                prefer-list-view
                show-all-filename-extensions
                disable-all-animations
                )
  }