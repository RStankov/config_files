require 'lib/installer.rb'

desc 'Install everything'
task :default => ['install:configs', 'install:textmate']

namespace :install do
  desc 'Install config files'
  task :configs do
    Dir['dot/*'].each do |file_name|
      Installer.link file_name, :link_name => ".#{File.basename(file_name)}"
    end

    Dir['normal/*'].each do |file_name|
      Installer.link file_name
    end
  end

  desc 'Configurate textmate'
  task :textmate do
    text_mate_path = "#{ENV['HOME']}/Library/Application Support/TextMate"

    %w[bundles plugins themes].each do |component|
      Installer.link_dir_contents "textmate/#{component}", "#{text_mate_path}/#{component.capitalize}"
    end

    system %Q[osascript -e 'tell app "TextMate" to reload bundles']

    Installer.defaults 'com.macromates.textmate', {
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
  end
end