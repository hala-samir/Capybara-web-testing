# frozen_string_literal: true

require 'bundler'
require 'capybara/dsl'
require 'capybara/rspec'

Bundler.setup(:default)
Bundler.require

# Which default browser do you want Selenium WebDriver to use?
# :selenium_chrome # Selenium driving Chrome
# :selenium_chrome_headless # Selenium driving Chrome in a headless configuration
# https://github.com/teamcapybara/capybara#selenium

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'http://automationpractice.com/index.php'
Capybara.default_max_wait_time = 10

# Run using:
# bundle exec rspec spec/features/login.rb --format documentation
RSpec.configure do |config|
  config.formatter = :documentation
end

#new method for login to be used through tests
def login(email, password)
  find(:xpath,'//*[@id="email"]').set(email)
  fill_in 'passwd', :with => password
  click_button 'SubmitLogin'  
end
