require 'lib/installer.rb'

desc 'Install everything'
task :default => ['configurate:dotfiles', 'configurate:osx', 'configurate:textmate']

namespace :configurate do
  desc 'Install config files'
  task :dotfiles do
    Dir['dot/*'].each do |file_name|
      Installer.link file_name, :link_name => ".#{File.basename(file_name)}"
    end

    Dir['normal/*'].each do |file_name|
      Installer.link file_name
    end
  end

  desc "Configurate osx preferences"
  task :osx do
     Installer.defaults 'com.apple.Terminal', {
       'Default Window Settings' => 'Pro',
       'Startup Window Settings' => 'Pro',
       'FocusFollowsMouse' => 'TRUE'
      }

      Installer.defaults 'com.apple.Dock', {
        'autohide' => 'TRUE',
        'magnification' => 'TRUE'
      }

      Installer.defaults 'com.apple.Safari', {
        'IncludeDebugMenu' => 'TRUE',
        'TargetedClicksCreateTabs' => 'TRUE'
      }

      Installer.defaults '-g', {
        'InitialKeyRepeat' => 15,
        'KeyRepeat' => 2
      }
  end

  desc 'Configurate textmate'
  task :textmate => ['textmate:bundles', 'textmate:preferences']

  namespace :textmate do
    desc 'Configurate textmate bundles'
    task :bundles do
      text_mate_path = "#{ENV['HOME']}/Library/Application Support/TextMate"
      %w[bundles plugins themes].each do |component|
        Installer.link_dir_contents "textmate/#{component}", "#{text_mate_path}/#{component.capitalize}"
      end

      system %Q[osascript -e 'tell app "TextMate" to reload bundles']
    end

    desc 'Configurate textmate preferences'
    task :preferences do
      Installer.defaults 'com.macromates.textmate', {
        'OakFolderReferenceFolderPattern'   => "-string '!.*/(\\.[^/]*|CVS|tmp|log|autotest|script|node_modules|tmp|_darcs|_MTN|\\{arch\\}|blib|.*~\\.nib|.*\\.(framework|app|pbproj|pbxproj|xcode(proj)?|bundle))$'",
        'OakTextViewLineNumbersEnabled'     => 1,
        'OakTextViewShowInvisiblesEnabled'  => 1,
        'OakWordCharacters'                 => "'-_'",
        'OakThemeManagerSelectedTheme'      => "'A4299D9B-1DE5-4BC4-87F6-A757E71B1597'",
        'OakTextViewNormalFontName'         => "-string 'Inconsolata'",
        'OakTextViewNormalFontSize'         => '16',
        'NSUserKeyEquivalents'              => '-object' + [
          '{',
            '"Find in Project..." = "@^$f";',
            '"Search Project With AckMate..." = "@$f";',
            '}'
        ].join(''),
        'OakShellVariables'                 => '-array ' + [
          '{enabled = 1; value = "PATH"; variable = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin";}',
          '{enabled = 1; value = "TM_GIT"; variable = "git";}',
          '{enabled = 1; value = "TM_RUBY"; variable = "ruby";}'
        ].map { |v| "'#{v}'" }.join(' ')
      }
    end
  end
end
