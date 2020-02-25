module Installer
  extend self

  def link_each(files)
    Dir[files].each do |file_path|
      link_path = yield File.basename(file_path)
      link(file_path, link_path)
    end
  end

  def link(file_path, link_path)
    Link.new(file_path, link_path).ensure_link
  end

  class Link
    def initialize(file_path, link_path)
      @file_path = file_path
      @link_path = File.join(ENV['HOME'], link_path)
    end

    def ensure_link
      puts "linking #{@link_path}"

      FileUtils.rm_rf(@link_path)
      FileUtils.ln_s(File.join(ENV['PWD'], @file_path), @link_path)
    end
  end
end
