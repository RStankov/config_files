require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber/rails'
  require 'cucumber/rspec/doubles'

  require 'capybara/rails'
  require 'capybara/cucumber'
  require 'capybara/session'

  require 'email_spec'
  require 'email_spec/cucumber'

  require File.expand_path(File.dirname(__FILE__) + '/driver')

  Capybara.default_selector = :css
  Capybara.server_port = 9887 + ENV['TEST_ENV_NUMBER'].to_i
  Capybara.server_boot_timeout = 50
  Capybara.default_wait_time = 10

  ActionController::Base.allow_rescue = false

  Cucumber::Rails::World.use_transactional_fixtures = true

  DatabaseCleaner.strategy = :deletion

  ActiveSupport::Dependencies.clear if Spork.using_spork?
end

Spork.each_run do
  require File.expand_path(File.dirname(__FILE__) + '/helpers')

  World(CucumberHelpers)
  World(Factory::Syntax::Methods)

  <%= app_const %>.reload_routes!

  I18n.reload!
end