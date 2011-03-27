def sudo(command)
  system "sudo #{command}"
end

def set_config(app, key, value)
  system "defaults write #{app} #{key} #{value}"
end

namespace :mac do
  desc 'Show all hidden file in the Finder'
  task :show_hidden_files do
    set_config 'com.apple.finder', 'AppleShowAllFiles', 'TRUE'
    system 'killall Finder'
  end

  desc 'Hide all hidden file in the Finder'
  task :hide_hidden_files do
    set_config 'com.apple.finder', 'AppleShowAllFiles', 'FALSE'
    system 'killall Finder'
  end
end