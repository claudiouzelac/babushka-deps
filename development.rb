# Mozilla Subhub
dep "stripe-mock.managed" do provides "stripe-mock" end
dep "node.managed" do provides "node" end
dep "yarn.managed" do provides "yarn" end
dep "graphviz.managed" do
    met? { in_path? "dot" }
    provides "graphviz"
end
dep "cloc.managed" do provides "cloc" end

# Mozilla Native
dep "cmake.managed" do provides "cmake" end

# Terminal     
dep "bash.managed" do provides "bash" end
dep "zsh.managed" do provides "zsh" end

# Mozilla DevOp
dep "aws-vault.cask"
dep "minikube.cask"
dep "awscli.managed" do provides "zsh" end
dep "gnupg.managed" do
    met? { in_path? "gpg" }
    provides "gnupg"
end

dep "shenderson terminal" do
    requires "homebrew"
    requires "bash.managed"
    requires "zsh.managed"
    requires "shenderson dotfiles"
end

dep "mozilla devops" do
    requires "git.managed"
    requires "homebrew"
    requires "homebrew cask"
    requires "aws-vault.cask"
    requires "awscli.managed"
    requires "gnupg.managed"
    requires "minikube.cask"
end

dep "mozilla subhub" do
  requires "git.managed"
  requires "homebrew"
  requires "python"
  requires "stripe-mock.managed"
  requires "node.managed"
  requires "yarn.managed"
  requires "graphviz.managed"
  requires "cloc.managed"
  requires "repository".with  :path => "~/workspace/subhub",
    :url => "git@github.com:mozilla/subhub.git",
    :branch => "master"
  met? {
    "~/workspace/subhub".p.exists?
  }
  requires "repository".with  :path => "~/workspace/fxa",
    :url => "git@github.com:mozilla/fxa.git",
    :branch => "master"
  met? {
    "~/workspace/fxa".p.exists?
  }
end

# TODO(low): Install [rr](https://github.com/mozilla/rr/)
dep "mozilla native" do
    requires "cmake.managed"
end