dep "mozilla laptop bootstrap" do
    requires [
        'git_configured'.with(:git_username => 'Stewart Henderson', :git_email => 'shenderson@mozilla.com'),
        'bash_configuration',
        'gpg_configuration',
        'mozilla devops',
        'mozilla subhub'
    ]
end
