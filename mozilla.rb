dep "mozilla laptop bootstrap" do
    requires [
        'git_configured'.with(:git_username => 'Stewart Henderson', :git_email => 'shenderson@mozilla.com'),
        'mozilla devops',
        'mozilla subhub'
    ]
end
