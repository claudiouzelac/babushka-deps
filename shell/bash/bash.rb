dep('.bashrc') {
    def config_file
      '~/.bashrc'
    end

    met? {
      Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.erb')
    }
    meet {
      render_erb '~/.babushka/deps/shell/bash/bashrc.erb', :to => config_file
    }
  }

dep('.bash_profile') {
  def config_file
    '~/.bash_profile'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('./shell/bash/bash_profile.erb')
  }
  meet {
    render_erb 'bash_profile.erb', :to => config_file
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
      Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/version.bash.erb')
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
      Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/aws.bash.erb')
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
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/serverless.bash.erb')
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
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/subhub.bash.erb')
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
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/papertrail.bash.erb')
  }
  meet {
    render_erb 'bashrc.d/papertrail.bash.erb', :to => config_file
  }
}

dep('docker.bash') {
  def config_file
    '~/.bashrc.d/papertrail.bash'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/docker.bash.erb')
  }
  meet {
    render_erb 'bashrc.d/docker.bash.erb', :to => config_file
  }
}

dep('gpg.bash') {
  def config_file
    '~/.bashrc.d/rust.bash'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/gpg.bash.erb')
  }
  meet {
    log "rendering bashrc.d/gpg.bash.erb to #{config_file}" do
      render_erb 'bashrc.d/gpg.bash.erb', :to => config_file
    end
  }
}

dep('ruby.bash') {
  def config_file
    '~/.bashrc.d/ruby.bash'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/ruby.bash.erb')
  }
  meet {
    log "rendering bashrc.d/ruby.bash.erb to #{config_file}" do
      render_erb 'bashrc.d/ruby.bash.erb', :to => config_file
    end
  }
}

dep('rust.bash') {
  def config_file
    '~/.bashrc.d/ruby.bash'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/shell/bash/bashrc.d/rust.bash.erb')
  }
  meet {
    log "rendering bashrc.d/rust.bash.erb to #{config_file}" do
      render_erb 'bashrc.d/rust.bash.erb', :to => config_file
    end
  }
}

dep 'bash' do
  requires [
    '.bashrc',
    '.bash_profile',
    'bashrc.d',
    'aws.bash',
    'version.bash',
    'serverless.bash',
    'subhub.bash',
    'papertrail.bash',
    'docker.bash',
    'gpg.bash',
    'ruby.bash',
    'rust.bash',
  ]
end
