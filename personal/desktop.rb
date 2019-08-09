dep "flux.cask"
dep "signal.cask"
dep "mas.managed"
dep("wunderlist.appstore") { id "410628904" }

dep "shenderson desktop" do
    requires [
        "flux.cask",
        "signal.cask",
        "wunderlist.appstore"
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