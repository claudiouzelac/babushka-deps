
dep "rcm.managed" do
    met? { in_path? "rcup" }
    requires_when_unmet "homebrew tap".with "thoughtbot/formulae"
    provides "rcup"
end

dep "shenderson dotfiles" do
    requires "rcm.managed"
    requires "repository".with  :path => "~/.dotfiles-bowlofstew",
                                :url => "https://github.com/bowlofstew/dotfiles.git",
                                :branch => "master"
  
    met? {
      # Require that the dotfiles repository is checked out _and_ installed (by checking just one dotfile)
      "~/.dotfiles-bowlofstew".p.exists? && (zshrc = "~/.zshrc".p).symlink? && zshrc.readlink == "~/.dotfiles-bowlofstew/zshrc".p
    }
  
    after {
      shell "rcup -d ~/.dotfiles-bowlofstew -x README.md -x LICENSE"
    }
  end
  
  dep "dotfiles", :template => "task" do
    requires "icelab dotfiles"
  
    run {
      shell "rcup"
    }
  end