module Installer
  extend self

  def link_each(files)
    Dir[files].each do |file_path|
      file_name = File.basename(file_path)
      link_path = block_given? ? yield(file_name) : ".#{file_name}"
      link(file_path, link_path)
    end
  end

  def link(file_path, link_path)
    file_path = file_path
    link_path = File.join(ENV['HOME'], link_path)

    puts "linking #{link_path}"

    FileUtils.rm_rf(link_path)
    FileUtils.ln_s(File.join(ENV['PWD'], file_path), link_path)
  end
end
