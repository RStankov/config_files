require 'lib/installer.rb'

desc 'Install config files'
task :default do
  Dir['dot/*'].each do |file_name|
    Installer.link file_name, :link_name => ".#{File.basename(file_name)}"
  end

  Dir['bin/*'].each do |file_name|
    Installer.link file_name, :directory => File.join(ENV['HOME'], 'bin')
  end
end
