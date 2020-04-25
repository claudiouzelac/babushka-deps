# GPG

dep "gnupg.managed"
dep "pinentry.managed"

dep "gpg" do
    requires [
        "gnupg.managed",
        "pinentry.managed"
    ]
end