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

  defaults = {
    'com.macromates.textmate' => {
      'OakFolderReferenceFolderPattern'   => "-string '!.*/(\\.[^/]*|CVS|tmp|log|autotest|script|public|tmp|_darcs|_MTN|\\{arch\\}|blib|.*~\\.nib|.*\\.(framework|app|pbproj|pbxproj|xcode(proj)?|bundle))$'",
      'OakTextViewLineNumbersEnabled'     => 1,
      'OakTextViewShowInvisiblesEnabled'  => 1,
      'OakWordCharacters'                 => "'-_'",
      'OakProjectDrawerPrefersRightEdge'  => 1,
      'OakProjectDrawerWidth'             => 300,
      'OakShellVariables'                 => '-array ' + [
        '{enabled = 1; value = "PATH"; variable = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin";}',
        '{enabled = 1; value = "TM_GIT"; variable = "git";}',
        '{enabled = 1; value = "TM_RUBY"; variable = "ruby";}'
      ].map { |v| "'#{v}'" }.join(' ')
    }
  }

  defaults.each do |application, settings|
    settings.each do |name, value|
      cmd = "defaults write #{application} #{name} #{value}"
      puts cmd
      system cmd
    end
  end
end