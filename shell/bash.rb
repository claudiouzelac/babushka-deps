dep('.bashrc') {
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

dep "bashrc.d" do 
    met? {
        "~/.bashrc.d".p.exists?
    }
    meet {
        shell("mkdir -p ~/.bashrc.d")
    }
end

dep('version.bash') {
    def config_file
      '~/.bashrc.d/version.bash'
    end
  
    met? {
      Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bashrc.d/version.bash.erb')
    }
    meet {
      render_erb 'bashrc.d/version.bash.erb', :to => config_file
    }
}

dep('aws.bash') {
    def config_file
      '~/.bashrc.d/aws.bash'
    end
  
    met? {
      Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bashrc.d/aws.bash.erb')
    }
    meet {
      render_erb 'bashrc.d/aws.bash.erb', :to => config_file
    }
}

dep('serverless.bash') {
  def config_file
    '~/.bashrc.d/serverless.bash'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bashrc.d/serverless.bash.erb')
  }
  meet {
    render_erb 'bashrc.d/serverless.bash.erb', :to => config_file
  }
}

dep('subhub.bash') {
  def config_file
    '~/.bashrc.d/subhub.bash'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bashrc.d/subhub.bash.erb')
  }
  meet {
    render_erb 'bashrc.d/subhub.bash.erb', :to => config_file
  }
}

dep('papertrail.bash') {
  def config_file
    '~/.bashrc.d/papertrail.bash'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bashrc.d/papertrail.bash.erb')
  }
  meet {
    render_erb 'bashrc.d/papertrail.bash.erb', :to => config_file
  }
}

dep 'bash' do
  requires [
    '.bashrc',
    'bashrc.d',
    'aws.bash',
    'version.bash',
    'serverless.bash',
    'subhub.bash',
    'papertrail.bash'
  ]
end