# Terminal     
dep "bash.managed" do provides "bash" end
dep "zsh.managed" do provides "zsh" end
dep "jq.managed" do provides "jq" end
    
dep "shenderson terminal" do
    requires [
        "homebrew",
        "bash.managed"
    ]
end