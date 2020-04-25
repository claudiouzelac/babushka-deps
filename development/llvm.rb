# Documentation:
#   https://arpith.xyz/2016/06/installing-llvm-from-source-ubuntu-16-04/
#   https://clang.llvm.org/get_started.html

dep "subversion.brew"

dep "checkout llvm workspace" do
    met? {
        "~/workspace/llvm".p.exists?
    }
    meet {
        shell("cd ~/workspace && svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm")
    }
end

dep "checkout llvm tools workspace" do
    met? {
        "~/workspace/llvm/tools".p.exists?
    }
    meet {
        shell("cd ~/workspace/llvm/tools && svn co http://llvm.org/svn/llvm-project/cfe/trunk clang")
    }
end

dep "checkout llvm compiler-rt workspace" do
    met? {
        "~/workspace/llvm/projects".p.exists?
    }
    meet {
        shell("cd ~/workspace/llvm/projects && svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt")
    }
end

dep "checkout llvm openmp workspace" do
    met? {
        "~/workspace/llvm/projects".p.exists?
    }
    meet {
        shell("cd ~/workspace/llvm/projects && svn co http://llvm.org/svn/llvm-project/openmp/trunk openmp")
    }
end

dep "checkout llvm libcxx workspace" do
    met? {
        "~/workspace/llvm/projects".p.exists?
    }
    meet {
        shell("cd ~/workspace/llvm/projects && svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx")
    }
end

dep "checkout llvm libcxxabi workspace" do
    met? {
        "~/workspace/llvm/projects".p.exists?
    }
    meet {
        shell("cd ~/workspace/llvm/projects && svn co http://llvm.org/svn/llvm-project/libcxxabi/trunk libcxxabi")
    }
end

dep "checkout llvm test-suite workspace" do
    met? {
        "~/workspace/llvm/projects".p.exists?
    }
    meet {
        shell("cd ~/workspace/llvm/projects && svn co http://llvm.org/svn/llvm-project/test-suite/trunk test-suite")
    }
end

dep "update llvm workspace" do
    meet {
        shell("cd ~/workspace && svn update")
    }
end

dep "llvm build directory" do
    met? {
        "~/workspace/llvm/build".p.exists?
    }
    meet {
        shell("cd ~/workspace/llvm/build")
    }
end

dep "llvm cmake generation" do
    meet{
        shell('cd ~/workspace/llvm/build && cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ..')
    }
end

dep "llvm.native" do
    requires [
        "subversion.brew",
        "checkout llvm workspace",
        "checkout llvm tools workspace",
        "checkout llvm compiler-rt workspace",
        "checkout llvm openmp workspace",
        "checkout llvm libcxx workspace",
        "checkout llvm libcxxabi workspace",
        "update llvm workspace",
        "llvm build directory",
        "llvm cmake generation"
    ]
end
