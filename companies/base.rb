dep "development workspace" do
    met? {
        "~/workspace".p.exists?
    }
    meet {
        shell("mkdir -p ~/workspace")
    }
end
