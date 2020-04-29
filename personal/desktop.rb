# Cask dependencies
dep "flux.cask"
dep "signal.cask"
dep "spideroakone.cask"
dep "anki.cask"
dep "folx.cask"
dep "evernote.cask"
dep "quartz.cask"

# AppStore Dependencies
dep "mas.managed"

# FLow Pomodoro Timer
# NOTE: Requires MAS above.
# https://apps.apple.com/app/id1423210932
dep("flow.appstore") { id "1423210932" }

# Wakatime download
dep 'wakatime.pip3'

dep "wakatime" do
  # Babushka will pull the source from here, and save it in
  # ~/.babushka/src for later (i.e. it only ever downloads once).
  # If the protocol is git:// then babushka will clone/update the
  # repo as required, and for all other protocols, it defers to
  # `curl`. Hence, babushka can handle any URI curl can, plus git://.
  source "https://github.com/gjsheep/bash-wakatime.git"
  # https://wakatime.com/terminal
end

dep "ntfs-3g.managed"
dep "osxfuse.cask"
dep "brave-browser.cask"

dep "shenderson desktop" do
    requires [
        "flux.cask",
        "signal.cask",
        "spideroakone.cask",
        "anki.cask",
        "evernote.cask",
        "wakatime.pip3",
        "osxfuse.cask",
        "ntfs-3g.managed",
        "flow.appstore",
        "brave-browser.cask"
    ]
end

meta :appstore do
    accepts_value_for :name, :basename
    accepts_value_for :id
    template {
      requires "mas.managed"
      def installed?
        installed_ids = `mas list`.split("\n").map { |line|
          match = line.match(/^(?<id>\d+)\s(?<name>.*)?\s\((?<version>[\d\.]+)\)$/)
          match[:id]
        }
        installed_ids.include?(id)
      end

      met? {
        installed = false
        5.times do |i|
          installed = true and break if installed?
          sleep i * 2
        end
        installed
      }

      meet {
        log_shell "Installing #{name} via Mac App Store", "mas install #{id}"
      }
    }
  end
