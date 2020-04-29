dep 'pycharm.cask'

dep 'python.managed' do
  requires { on :osx, 'homebrew' }
  installs 'python'
end

dep 'pip' do
  met? { in_path? 'pip' }
  meet shell('python3 get-pip.py')
end

dep 'python' do
  requires [
    'python.managed',
    'pycharm.cask',
    'pip'
  ]
end
