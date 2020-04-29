dep 'mozilla workspace' do
  met? '~/workspace/mozilla'.p.exists?
  meet shell('mkdir -p ~/workspace/mozilla')
end

dep 'mozilla laptop bootstrap' do
  requires [
    'git_configured'.with(
      git_username => 'Stewart Henderson',
      git_email => 'shenderson@mozilla.com'
    ),
    'bash_configuration',
    'gpg_configuration',
    'mozilla workspace',
    'mozilla devops',
    'mozilla subhub'
  ]
end
