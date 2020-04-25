dep "pycharm.cask"

# The below code is a workaround that executes on 
# every execution of `babushka meet python` call as
# the pip3 installation doesn't execute cleanly as 
# expected.  TODO: Investigate the root cause.
# 
# dep 'mozilla-aws-cli.pip' do
#     installs 'mozilla-aws-cli'
# end
# 
dep "mozilla-aws-cli" do
    meet {
        shell("pip3 install mozilla-aws-cli")
    }
end

dep 'python.managed' do
    requires { on :osx, 'homebrew' }
    installs 'python'
end

dep "pip" do
    met? { in_path? "pip3" }
    meet {
        shell("curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && sudo python get-pip.py")
    }
end

dep 'python' do
    requires [
        'python.managed',
        'pip',
        'pycharm.cask',
        'mozilla-aws-cli'
    ]
end
