module RSpec
  module Mate
    # This is based on Ruy Asan's initial code:
    # http://ruy.ca/posts/6-A-simple-switch-between-source-and-spec-file-command-for-textmate-with-auto-creation-
    class SwitchCommand
      def go_to_twin(project_directory, filepath)
        other = twin(filepath)
        if File.file?(other)
          %x{ "$TM_SUPPORT_PATH/bin/mate" "#{other}" }
        else
          relative = other[project_directory.length+1..-1]
          file_type = file_type(other)
          if create?(relative, file_type)
            content = content_for(file_type, relative)
            write_and_open(other, content)
          end
        end
      end
      
      module Framework
        def rails?
          File.exist?(File.join(self, 'config', 'boot.rb'))
        end

        def merb?
          File.exist?(File.join(self, 'config', 'init.rb'))
        end
      end
      
      def twin(path)
        if path =~ /^(.*?)\/(lib|app|spec)\/(.*?)$/
          framework, parent, rest = $1, $2, $3
          framework.extend Framework

          case parent
            when 'lib', 'app' then
              if framework.rails? || framework.merb?
                path = path.gsub(/\/app\//, "/spec/")
                path = path.gsub(/\/lib\//, "/spec/lib/")
              else
                path = path.gsub(/\/lib\//, "/spec/")
              end
              path = path.gsub(/\.rb$/, "_spec.rb")
              path = path.gsub(/\.erb$/, ".erb_spec.rb")
              path = path.gsub(/\.haml$/, ".haml_spec.rb")
              path = path.gsub(/\.rhtml$/, ".rhtml_spec.rb")
              path = path.gsub(/\.rjs$/, ".rjs_spec.rb")
            when 'spec' then
              path = path.gsub(/\.rjs_spec\.rb$/, ".rjs")
              path = path.gsub(/\.rhtml_spec\.rb$/, ".rhtml")
              path = path.gsub(/\.erb_spec\.rb$/, ".erb")
              path = path.gsub(/\.haml_spec\.rb$/, ".haml")
              path = path.gsub(/_spec\.rb$/, ".rb")
              if framework.rails? || framework.merb?
                path = path.gsub(/\/spec\/lib\//, "/lib/")
                path = path.gsub(/\/spec\//, "/app/")
              else
                path = path.gsub(/\/spec\//, "/lib/")
              end
          end
          return path
        end
      end
      
      def file_type(path)
        if path =~ /^(.*?)\/(spec)\/(controllers|helpers|models|views)\/(.*?)$/
          return "#{$3[0..-2]} spec"
        end
        if path =~ /^(.*?)\/(app)\/(controllers|helpers|models|views)\/(.*?)$/
          return $3[0..-2]
        end
        if path =~ /_spec\.rb$/
          return "spec"
        end
        "file"
      end
      
      def create?(relative_twin, file_type)
        answer = `'#{ ENV['TM_SUPPORT_PATH'] }/bin/CocoaDialog.app/Contents/MacOS/CocoaDialog' yesno-msgbox --no-cancel --icon document --informative-text "#{relative_twin}" --text "Create missing #{file_type}?"`
        answer.to_s.chomp == "1"
      end

      def content_for(file_type, relative_path)
        case file_type
          when /spec$/ then
            spec(relative_path)
          when "controller"
            <<-CONTROLLER
class #{class_from_path(relative_path)} < ApplicationController
end
CONTROLLER
          when "model"
            <<-MODEL
class #{class_from_path(relative_path)} < ActiveRecord::Base
end
MODEL
          when "helper"
            <<-HELPER
module #{class_from_path(relative_path)}
end
HELPER
          when "view"
            ""
          else
            klass(relative_path)
        end
      end
      
      def class_from_path(path)
        underscored = path.split('/').last.split('.rb').first
        parts = underscored.split('_')
        parts.inject("") do |word, part|
          word << part.capitalize
          word
        end
      end
      
      # Extracts the snippet text
      def snippet(snippet_name)
        snippet_file = File.expand_path(File.dirname(__FILE__) + "/../../../../Snippets/#{snippet_name}")
        xml = File.open(snippet_file).read
        xml.match(/<key>content<\/key>\s*<string>([^<]*)<\/string>/m)[1]
      end
      
      def spec(path)
        content = <<-SPEC
require 'spec_helper'

#{snippet("Describe_type.tmSnippet")}
SPEC
      end

      def klass(relative_path, content=nil)
        parts = relative_path.split('/')
        lib_index = parts.index('lib') || 0
        parts = parts[lib_index+1..-1]
        lines = Array.new(parts.length*2)
        parts.each_with_index do |part, n|
          part = part.capitalize
          indent = "  " * n
          line = if part =~ /(.*)\.rb/
            part = $1
            "#{indent}class #{part}"
          else
            "#{indent}module #{part}"
          end
          lines[n] = line
          lines[lines.length-(n+1)] = "#{indent}end"
        end
        lines.join("\n") + "\n"
      end
      
      def write_and_open(path, content)
        `mkdir -p "#{File.dirname(path)}"`
        `touch "#{path}"`
        `"$TM_SUPPORT_PATH/bin/mate" "#{path}"`
        `osascript &>/dev/null -e 'tell app "SystemUIServer" to activate' -e 'tell app "TextMate" to activate'`
        escaped_content = content.gsub("\n","\\n").gsub('$','\\$').gsub('"','\\\\\\\\\\\\"')
        `osascript &>/dev/null -e "tell app \\"TextMate\\" to insert \\"#{escaped_content}\\" as snippet true"`      
      end
    end
  end
end
