dep "pycharm.cask"
dep "pyenv.managed" do installs 'pyenv' end
# https://hackernoon.com/reaching-python-development-nirvana-bb5692adf30c
dep "pipenv.managed" do installs 'pipenv' end

dep 'python.managed' do
    requires { on :osx, 'homebrew' }
    installs 'python'
end

dep 'python' do
    requires [
        'python.managed',
        'pycharm.cask',
        'pyenv.managed',
        'pipenv.managed'
    ]
end