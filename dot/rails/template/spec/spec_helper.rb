# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

require 'shoulda'
require 'factory_girl'
require 'paperclip/matchers'

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true

  config.include Paperclip::Shoulda::Matchers
end
