# Mozilla Subhub
dep "stripe-mock.managed" do provides "stripe-mock" end
dep "node.managed" do provides "node" end
dep "yarn.managed" do provides "yarn" end
dep "graphviz.managed" do
    met? { in_path? "dot" }
    provides "graphviz"
end
dep "cloc.managed" do provides "cloc" end

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