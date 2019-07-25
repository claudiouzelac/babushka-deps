dep('bash_configuration') {
    def config_file
      '~/.bashrc'
    end
  
    met? {
      Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bashrc.erb')
    }
    meet {
      render_erb 'bashrc.erb', :to => config_file
    }
  }