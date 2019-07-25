# Mozilla DevOp
dep "aws-vault.cask"
dep "minikube.cask"
dep "awscli.managed" do provides "zsh" end
dep "gnupg.managed" do
    met? { in_path? "gpg" }
    provides "gnupg"
end

dep 'papertrail.gem' do
    installs 'papertrail == 0.9.14'
    provides 'papertrail'
end

dep "mozilla devops" do
    requires [
        "git.managed",
        "homebrew",
        "homebrew cask",
        "aws-vault.cask",
        "awscli.managed",
        "gnupg.managed",
        "minikube.cask",
        "papertrail.gem"
    ]
end