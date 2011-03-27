desc "install the dot files into user's home directory"
task :install do
  Dir['dot/*'].each do |file_name|
    Installer.link file_name, ".#{File.basename(file_name)}"
  end

  Dir['normal/*'].each do |file_name|
    Installer.link file_name
  end
end

class Installer
  class << self
    def link(file_name, link_name = File.basename(file_name))
      link = self.new(file_name, link_name)

      if link.already_exists?
        link.propose_overwrite
      else
        link.create
      end
    end
  end

  def initialize(file_name, link_name)
    @file_name = file_name
    @link_name = link_name
  end

  def already_exists?
    File.exist? File.join(ENV['HOME'], @link_name)
  end

  def propose_overwrite
    puts "overwrite #{link_path_name} ? [ynq] "
    case $stdin.gets.chomp
      when 'y' then replace
      when 'n' then puts "skipping #{link_path_name}"
      when 'q' then exit
    end
  end

  def replace
    system "rm #{link_path_name}"
    create
  end

  def create
    puts "linking #{link_path_name}"
    system "ln -s $PWD/#{@file_name} #{link_path_name}"
  end

  private

  def link_path_name
    "~/#{@link_name}"
  end
end
