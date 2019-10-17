# Cask dependencies
dep "flux.cask"
dep "signal.cask"
dep "spideroakone.cask"
dep "anki.cask"
dep "folx.cask"
dep "evernote.cask"
dep "librecad.cask"
dep "gimp.cask"
dep "charles.cask"
dep "caffeine.cask"
dep "rescuetime.cask"

# AppStore Dependencies
dep "mas.managed"

# NOTE: Requires MAS above.
dep("wunderlist.appstore") { id "410628904" }

# Wakatime download
dep 'wakatime.pip' do
  installs 'wakatime'
end

dep "wakatime" do
  # Babushka will pull the source from here, and save it in
  # ~/.babushka/src for later (i.e. it only ever downloads once).
  # If the protocol is git:// then babushka will clone/update the
  # repo as required, and for all other protocols, it defers to
  # `curl`. Hence, babushka can handle any URI curl can, plus git://.
  source "https://github.com/gjsheep/bash-wakatime.git"
  # https://wakatime.com/terminal
end

dep "shenderson desktop" do
    requires [
        "flux.cask",
        "signal.cask",
        "spideroakone.cask",
        "wunderlist.appstore",
        "anki.cask",
        "folx.cask",
        "evernote.cask",
        "librecad.cask",
        "gimp.cask",
        "charles.cask",
        "rescuetime.cask",
        "wakatime.pip"
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
