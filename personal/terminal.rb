# Terminal     
dep "bash.managed" do provides "bash" end

# JSON Manipulation
dep "jq.managed" do provides "jq" end

# Password management 
dep "pass.managed" do provides "pass" end
dep "pass-otp.managed" do provides "pass-otp" end

dep "pass-extension" do
    requires "homebrew tap".with "simplydanny/pass-extensions"
    meet {
        "pass-update.managed"
    }
end
    
dep "shenderson terminal" do
    requires [
        "homebrew",
        "bash.managed",
        "pass.managed",
        "pass-extension"
    ]
end