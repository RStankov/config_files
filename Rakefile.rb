require_relative 'lib/installer.rb'

desc 'OS X settings'
task :osx do
  sh 'bash ~/.osx'
end

desc 'Download submodules'
task :submodule do
  sh 'git submodule init'
  sh 'git submodule update'
end

desc 'Installs vim bundles'
task :vim_bundles do
  sh 'vim +PlugInstall +qall'
end

desc 'Links config files'
task :link do
  Installer.link_each('dot/*') do |file_name| 
    if file_name == 'nvim'
      ".config/#{file_name}"
    else
      ".#{file_name}"
    end
  end
  Installer.link('bin', 'bin')
end

desc 'Install config files'
task install: [:submodule, :link, :vim_bundles, :osx]

task default: :link
