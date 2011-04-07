desc "install the dot files into user's home directory"
task :install do
  Dir['dot/*'].each do |file_name|
    Installer.link file_name, :link_name => ".#{File.basename(file_name)}"
  end

  Dir['normal/*'].each do |file_name|
    Installer.link file_name
  end

  Dir['textmate/bundles/*'].each do |file_name|
    Installer.link file_name, :directory => "#{Installer::TEXTMATE_PATH}/Bundles"
  end

  Dir['textmate/plugins/*'].each do |file_name|
    Installer.link file_name, :directory => "#{Installer::TEXTMATE_PATH}/Plugins"
  end
end

class Installer
  TEXTMATE_PATH = "#{ENV['HOME']}/Library/Application Support/TextMate"

  class << self
    def link(file_name, options = {})
      link = self.new(file_name, options)

      if link.already_exists?
        link.propose_overwrite
      else
        link.create
      end
    end
  end

  def initialize(file_name, options = {})
    @file_name = file_name
    @link_name = options.delete(:link_name) || File.basename(file_name)
    @directory = options.delete(:directory) || ENV['HOME']
  end

  def already_exists?
    File.exist? link_path
  end

  def propose_overwrite
    puts "overwrite #{link_path} ? [ynq] "
    case $stdin.gets.chomp
      when 'y' then replace
      when 'n' then puts "skipping #{link_path}"
      when 'q' then exit
    end
  end

  def replace
    system "rm #{e link_path}"
    create
  end

  def create
    puts "linking #{link_path}"
    system "ln -s $PWD/#{e @file_name} #{e link_path}"
  end

  private

  def link_path
    File.join(@directory, @link_name)
  end

  def e(path)
    path.gsub(' ', '\ ')
  end
end
