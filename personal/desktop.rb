# Cask dependencies
dep 'flux.cask'
dep 'signal.cask'
dep 'spideroakone.cask'
dep 'anki.cask'
dep 'folx.cask'
dep 'evernote.cask'
dep 'quartz.cask'

# Wakatime download
dep 'wakatime.pip3'

dep 'wakatime' do
  # Babushka will pull the source from here, and save it in
  # ~/.babushka/src for later (i.e. it only ever downloads once).
  # If the protocol is git:// then babushka will clone/update the
  # repo as required, and for all other protocols, it defers to
  # `curl`. Hence, babushka can handle any URI curl can, plus git://.
  source 'https://github.com/gjsheep/bash-wakatime.git'
  # https://wakatime.com/terminal
end

dep 'ntfs-3g.managed'
dep 'osxfuse.cask'
dep 'brave-browser.cask'

dep 'shenderson desktop' do
  requires [
    'flux.cask',
    'signal.cask',
    'spideroakone.cask',
    'anki.cask',
    'evernote.cask',
    'wakatime.pip3',
    'osxfuse.cask',
    'ntfs-3g.managed',
    'brave-browser.cask'
  ]
end
