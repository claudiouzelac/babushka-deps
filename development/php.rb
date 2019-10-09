dep "hhvm" do
    met? { in_path? "hhvm" }
    requires_when_unmet "homebrew tap".with "hhvm/hhvm"
    provides "hhvm"
end

dep "php" do
    requires [
        "hhvm",
    ]
end
