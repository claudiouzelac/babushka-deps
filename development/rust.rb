# Kafka

dep "curl.managed" do provides "curl" end

dep "rustup" do
    met? { in_path? "rustup" }
    meet {
        shell("curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y")
        shell("source $HOME/.cargo/env")
    }
end

dep "rust development" do
    requires [
        "curl.managed",
        "rustup",
    ]
end