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

Capybara.default_driver = :selenium_chrome_headless
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

def add_product_check_it_out
  visit '/index.php?id_category=8&controller=category'
  all('.button.ajax_add_to_cart_button>span:nth-child(1)').first().click()
  click_on 'Proceed to checkout'
  click_on 'Proceed to checkout'
  click_on 'Proceed to checkout'
  find(:xpath, '//*[@id="cgv"]', visible: false).click()
  click_on 'Proceed to checkout'
end

def pay_by_bank_wire
  click_on 'Pay by bank wire'
end

def pay_by_check
  click_on 'Pay by check'
end

def confirm_order
  click_on 'I confirm my order'
end

def fill_profile_data(address, city,mobile,street)
  find(:xpath,'//*[@id="center_column"]/div/div[1]/ul/li[3]').click()
  expect(page).to have_content('Your addresses are listed below.')
  click_on 'Add a new address'
  fill_in 'address1', :with => address
  fill_in 'city', :with => city
  find(:xpath, '//*[@id="id_state"]/option[2]').click
  fill_in 'postcode', :with => '00000'
  fill_in 'phone_mobile', :with => mobile
  fill_in 'alias', :with => street
end


