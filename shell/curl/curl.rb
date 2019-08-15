dep 'curlrc' do
    met? {
      Babushka::Renderable.new('~/.curlrc').from?('shell/curl/curlrc.erb')
    }
    meet {
      render_erb 'shell/curl/curlrc.erb', :to => '~/.curlrc'
    }
end