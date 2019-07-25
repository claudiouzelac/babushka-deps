

dep "mozilla subhub" do
  requires "python"
  requires "repository".with  :path => "~/workspace/subhub",
    :url => "git@github.com:mozilla/subhub.git",
    :branch => "master"
  met? {
    "~/workspace/subhub".p.exists?
  }
end