dep 'gpg_directory' do
    def gnu_directory
      '~/.gnupg/'
    end
    met? {
      gnu_directory.p.exists?
    }
    meet {
      shell("mkdir -p #{gnu_directory}")
      shell("sudo chmod -R `whoami` #{gnu_directory}")
    }
end
  
dep 'gpg_configuration' do
    requires 'gpg_directory'
    def config_file
      '~/.gnupg/gpg.conf'
    end
  
    met? {
      Babushka::Renderable.new(config_file).from?('shell/gnupg/gnupg.conf.erb')
    }
    meet {
      render_erb 'shell/gnupg/gnupg.conf.erb', :to => config_file
    }
end