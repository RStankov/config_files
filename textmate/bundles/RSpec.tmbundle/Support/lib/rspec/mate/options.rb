module RSpec
  module Mate
    module Options
      def options
        @options ||= begin
                       options = {}
                       rspec_tm_opts = File.join(ENV['TM_PROJECT_DIRECTORY'], '.rspec-tm')
                       if File.exist?(rspec_tm_opts)
                         raw_options = File.readlines(rspec_tm_opts).join(" ").split(/\s+/)
                         current_key = nil
                         raw_options.each do |opt|
                           if opt =~ /^-/
                             current_key = opt
                             options[current_key] = true
                           else
                             options[current_key] = transform(opt)
                           end
                         end
                       end
                       options
                     end
      end

      def []=(k,v)
        options[k] = v
      end

      def [](k)
        options[k]
      end

      def transform(val)
        case val.downcase
        when 'yes','true','on'
          true
        when 'no','false','off'
          false
        else
          val
        end
      end

      module_function :options, :[], :[]=, :transform
    end
  end
end
