require 'rubygems'
require 'spork'

Spork.prefork do
  ENV['RAILS_ENV'] ||= 'test'

  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'

  if Spork.using_spork?
    ActiveSupport::Dependencies.clear
    ActiveRecord::Base.instantiate_observers
  end
end

Spork.each_run do
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  <%= app_const %>::Application.reload_routes!

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.include Factory::Syntax::Methods
    config.include EmailSpec::Helpers
    config.include EmailSpec::Matcher

    config.include SpecSupport::Model, :type => :model
    config.include SpecSupport::Controller, :type => :controller
  end
end