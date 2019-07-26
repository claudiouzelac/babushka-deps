dep('hide-battery-percentage') {
    shell('defaults write com.apple.menuextra.battery ShowPercent -string "NO"')
  }
  
dep('show-remaining-time') {
    shell('defaults write com.apple.menuextra.battery ShowTime -string "YES"')
}