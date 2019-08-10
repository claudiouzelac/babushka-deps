# Mozilla Native
dep "cmake.managed" do provides "cmake" end

dep "gdb.managed" do 
    provides "gdb" 
end

dep "gdbinit" do
    met? {
        "~/.gdbinit".p.exists?
    }
    meet {
        shell('echo "set startup-with-shell off" >> ~/.gdbinit')
    }
end

# Reference: https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Introduction

dep "workspace" do
    met? {
        "~/workspace".p.exists?
    }
    meet {
        shell("mkdir -p ~/workspace")
    }    
end

dep "mozilla workspace" do 
    met? {
        "~/workspace/mozilla".p.exists?
    }
    meet {
        shell("mkdir -p ~/workspace/mozilla")
    }
end

dep "mozilla firefox directory" do
    met? {
        "~/workspace/mozilla/firefox".p.exists?
    }
    meet {
        shell("mkdir -p ~/workspace/mozilla/firefox")
    }
end

# TODO: Figure out OSX build
dep "mozilla rr" do 
    met? {
        "~/workspace/mozilla/rr".p.exists?
    }
    meet {
        shell("git clone https://github.com/mozilla/rr.git ~/workspace/mozilla/rr")
        shell("cd ~/workspace/mozilla/rr && mkdir obj && cd obj && cmake .. && make -j8  && sudo make install")
    }
end

# https://www.gdbgui.com/
dep "gdbui" do
    requires { 
        on :osx, 'homebrew'
    }
    met? { in_path? "gdbgui" }
    meet {
        shell("sudo pip3 install gdbgui==0.13.2.0 ")
    }
end

# TODO(low): Install [rr](https://github.com/mozilla/rr/)
dep "mozilla native" do
    requires [
        "cmake.managed",
        "python",
        "workspace",
        "mozilla workspace",
        "mozilla firefox directory",
        "gdb.managed",
        "gdbui",
        "gdbinit"
    ]
end