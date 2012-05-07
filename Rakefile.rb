require 'lib/installer.rb'

desc 'Install config files'
task :default do
  Installer.link('dot/*') { |file_name| ".#{file_name}" }
  Installer.link('bin/*') { |file_name| File.join 'bin', file_name }
end
