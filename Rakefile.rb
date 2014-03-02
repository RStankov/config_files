require_relative 'lib/installer.rb'

desc 'Install config files'
task :install do
  Installer.link_each('dot/*') { |file_name| ".#{file_name}" }
  Installer.link_each('bin/*') { |file_name| File.join 'bin', file_name }
  Installer.link('others/Alfred.alfredpreferences', 'Dropbox/Apps/Alfred/Alfred.alfredpreferences')
end

task default: :install
