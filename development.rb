dep "stripe-mock.managed" do provides "stripe-mock" end
dep "cmake.managed" do provides "cmake" end
dep "node.managed" do provides "node" end

dep "mozilla subhub" do
  requires "python"
  requires "stripe-mock.managed"
  requires "node.managed"
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

# dep "kubectl.managed" do
#     provides "kubectl"
# end

# dep "mozilla kubernetes" do
#     requires "kubectl.managed",
#              "minikube.cask"
# end