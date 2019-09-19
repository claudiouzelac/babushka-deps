# Functions for rendering bashrc files

# Ensures a Git repository exists and is up-to-date
#
#   * source_path:      T
#   * destination_path:       
#
dep 'bashrc.d', :source_path, :destination_path => 'bashrcd' do
    requires 'exists.repo'.with(path, url),
             'branch.repo'.with(path, branch),
             'up-to-date.repo'.with(path)
end