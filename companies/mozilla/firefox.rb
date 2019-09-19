# Relevant documentation:
#   https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Build_Instructions/Mac_OS_X_Prerequisites
#   https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Build_Instructions/Simple_Firefox_build/Linux_and_MacOS_build_preparation

dep "mercurial.brew"

dep "mozilla sync firefox" do
    met? {
        "~/workspace/mozilla/mozilla-central".p.exists?
    }
    meet {
        shell("cd ~/workspace/mozilla/ && hg clone https://hg.mozilla.org/mozilla-central")
    }
end

dep "mozilla firefox" do
    requires [
        "mozilla native",
        "mercurial.brew",
        "mozilla sync firefox",
    ]
end