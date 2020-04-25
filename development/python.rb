dep "pycharm.cask"
# https://hackernoon.com/reaching-python-development-nirvana-bb5692adf30c
dep "pipenv.managed" do installs 'pipenv' end
dep "pyenv.managed" do installs 'pyenv' end

dep 'python.managed' do
    requires { on :osx, 'homebrew' }
    installs 'python'
end

dep "pip" do
    met? { in_path? "pip" }
    meet {
        shell("curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && sudo python get-pip.py")
    }
end

dep 'python' do
    requires [
        'python.managed',
        'pycharm.cask',
        'pyenv.managed',
        'pipenv.managed',
        'pyenv.managed',
        'pip'
    ]
end
