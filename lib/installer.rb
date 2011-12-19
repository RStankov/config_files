class Installer
  class << self
    def link(file_name, options = {})
      link = self.new(file_name, options)

      if link.already_exists?
        link.replace
      else
        link.create
      end
    end

    def link_dir_contents(from, to)
      FileUtils.mkdir_p to

      Dir["#{from}/*"].each do |file_name|
        Installer.link file_name, :directory => to
      end
    end

    def defaults(application, settings)
      settings.each do |name, value|
        cmd = %Q(defaults write #{application} "#{name}" #{value})
        puts cmd
        system cmd
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

  def replace
    system "rm -rf #{e link_path}"
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
    path.gsub(/( |\(|\))/){ |s| '\\' + s }
  end
end
