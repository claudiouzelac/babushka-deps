dep "pycharm.cask"

dep 'python.managed' do
    requires { on :osx, 'homebrew' }
    installs 'python'
end

dep 'python' do
    requires 'python.managed',
             'pycharm.cask'
end