class Installer
  class << self
    def link(files)
      Dir[files].each do |file_path|
        link_path = yield File.basename(file_path)
        Link.new(file_path, link_path).ensure_link
      end
    end
  end

  class Link
    def initialize(file_path, link_path)
      @file_path = file_path
      @link_path = File.join ENV['HOME'], link_path
    end

    def ensure_link
      remove if already_exists?
      create
    end

    private

    def already_exists?
      File.exist? @link_path
    end

    def remove
      system "rm -rf #{e @link_path}"
    end

    def create
      puts "linking #{@link_path}"
      system "ln -s $PWD/#{e @file_path} #{e @link_path}"
    end

    def e(path)
      path.gsub(/( |\(|\))/) { |s| '\\' + s }
    end
  end
end
