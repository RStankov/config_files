require_relative 'lib/installer.rb'

desc 'Download submodules'
task :submodule do
  sh 'git submodule init'
  sh 'git submodule update'
end

desc 'Installs vim bundles'
task :vim_bundles do
  sh 'vim +BundleInstall +qall'
end

desc 'Links config files'
task :link do
  Installer.link_each('dot/*') { |file_name| ".#{file_name}" }
  Installer.link_each('bin/*') { |file_name| File.join 'bin', file_name }
  Installer.link('others/Alfred.alfredpreferences', 'Dropbox/Apps/Alfred/Alfred.alfredpreferences')
end

desc 'Install config files'
task install: [:submodule, :link, :vim_bundles]

task default: :link
