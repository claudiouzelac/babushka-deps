dep "virtualbox.cask"
dep "vagrant.cask"

dep "vagrant" do
    requires [
        "virtualbox.cask",
        "vagrant.cask"
    ]
end
