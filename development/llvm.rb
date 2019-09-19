# Documentation:
#   https://arpith.xyz/2016/06/installing-llvm-from-source-ubuntu-16-04/

dep "subversion.brew"

dep "checkout llvm workspace" do 
    met? {
        "~/workspace/llvm".p.exists?
    }
    meet {
        shell("cd ~/workspace && svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm")
    }
end

dep "update llvm workspace" do
    meet {
        shell("cd ~/workspace && svn update")
    }
end

dep "llvm.native" do
    requires [
        "subversion.brew",
        "checkout llvm workspace",
        "update llvm workspace",
    ]
end