module Jasmine
  # Note - this is necessary for rspec2, which has removed the backtrace
  class SpecBuilder
    def declare_spec(parent, spec)
      me = self
      example_name = spec["name"]
      @spec_ids << spec["id"]
      backtrace = @example_locations[parent.description + " " + example_name]
      parent.it example_name, {} do
        me.report_spec(spec["id"])
      end
    end
  end

  # overwrite the original Jasmine.app to support the Rails asset pipeline
  class << self
    alias :default_app :app

    def app(config)
      Rails.application.initialize!

      sprockets_env = Rails.application.assets
      sprockets_env.append_path Rails.root # added for accessing spec/javascripts/*_spec.js via the pipeline

      jasmine_app = default_app(config)

      Rack::Builder.app do
        map('/assets') { run sprockets_env }
        map('/')       { run jasmine_app }
      end
    end
  end

  # proccess every Jasmine js file via Rails assset pipeline
  class Config
    def spec_path
      '/assets/spec/javascripts'
    end

    def src_files
      simple_config['src_files'].map { |path| "assets/#{path}" }
    end
  end
end
