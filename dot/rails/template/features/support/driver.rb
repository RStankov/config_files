Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['network.manage-offline-status'] = false
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end
