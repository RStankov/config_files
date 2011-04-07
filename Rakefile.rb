require 'lib/installer.rb'

task :default => [:install]

desc "install config files into user's home directory"
task :install do
  Dir['dot/*'].each do |file_name|
    Installer.link file_name, :link_name => ".#{File.basename(file_name)}"
  end

  Dir['normal/*'].each do |file_name|
    Installer.link file_name
  end

  text_mate_path = "#{ENV['HOME']}/Library/Application Support/TextMate"

  Dir['textmate/bundles/*'].each do |file_name|
    Installer.link file_name, :directory => "#{text_mate_path}/Bundles"
  end

  Dir['textmate/plugins/*'].each do |file_name|
    Installer.link file_name, :directory => "#{text_mate_path}/Plugins"
  end
end
