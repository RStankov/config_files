namespace :sprockets do
  desc "Clear sprockets cache"
  task :clear do
    require "fileutils"

    path = File.join(Rails.public_path, "sprockets")
    if File.directory? path
      FileUtils.rm_r path
    end
  end

  desc "Compile sprockets"
  task :compile do
    require "yui/compressor"
    require "sprocketizer/sprocket"
    require "fileutils"

    (ENV["FILE"] || "application").split(",").each do |file_name|

      source = Sprocketizer::Sprocket.new(file_name).source.to_s
      source = YUI::JavaScriptCompressor.new.compress(source)

      file_path = File.join(Rails.public_path, "sprockets")
      unless File.directory? file_path
        FileUtils.mkdir file_path
      end

      File.open(File.join(file_path, file_name + ".js"), "w+") do |file|
        file << source
      end
    end
  end
end