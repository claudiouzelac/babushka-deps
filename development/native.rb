# Mozilla Native
dep "cmake.managed" do provides "cmake" end
dep "clang-format.managed" do provides "clang-format" end
dep "yasm.managed" do provides "yasm" end
dep "mercurial.managed" do provides "mercurial" end
dep "gawk.managed" do provides "gawk" end
dep "ccache.managed" do provides "ccache" end
dep "autoconf.managed" do provides "autoconf" end
dep "libidl.managed" do provides "libidl" end
dep "mas.managed"
dep("xcode.appstore") { id "97799835" }

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

# https://apps.apple.com/us/app/xcode/id497799835?mt=12
dep "pip" do
    met? { in_path? "pip" }
    meet {
        shell("curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && sudo python get-pip.py")
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
        "yasm.managed",
        # "mercurial.managed",
        "gawk.managed",
        "ccache.managed",
        "autoconf.managed",
        # "libidl.managed",
        "gdb.managed",
        "gdbui",
        "gdbinit"
    ]
end
