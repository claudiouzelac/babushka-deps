dep 'bowlofstew.github.io' do
    requires "repository".with  :path => "~/workspace/bowlofstew.github.io.git",
      :url => "git@github.com:bowlofstew/bowlofstew.github.io.git",
      :branch => "master"
    met? {
      "~/workspace/bowlofstew.github.io.git".p.exists?
    }
end

dep 'jekyll.gem' do
    provides 'jekyll'
end

dep 'jekyll-gist.gem' do
    provides 'jekyll-gist'
end

dep 'pygments.rb.gem' do
    provides 'pygments.rb'
end

dep "ruby.managed"
dep "rbenv.managed"
dep "ruby-build.managed"
dep("rbenv.init") {
    shell("rbenv install 2.4.0")
    shell("rbenv global 2.4.0")
}

dep 'blog' do
    requires [
        "bowlofstew.github.io",
        "rbenv.init",
        "jekyll.gem",
        "jekyll-gist.gem",
        "pygments.rb.gem",
    ]
end