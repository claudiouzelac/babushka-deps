# Terminal     
dep "bash.managed" do provides "bash" end
dep "zsh.managed" do provides "zsh" end
    
dep "shenderson terminal" do
    requires [
        "homebrew",
        "bash.managed"
    ]
end