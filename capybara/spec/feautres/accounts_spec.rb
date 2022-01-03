require 'spec_helper'

feature 'Visit The Product Page' do
  background do
    visit '/index.php?controller=authentication&back=my-account'
  end

  scenario 'verify that user can sign up' do  
    fill_in 'email_create', :with => FFaker::Internet.email
    click_button 'SubmitCreate'
    fill_in 'customer_firstname', :with => FFaker::Name.first_name
    fill_in 'customer_lastname', :with => FFaker::Name.last_name
    fill_in 'passwd', :with => FFaker::Internet.password
    fill_in 'address1', :with => FFaker::Address.street_address
    fill_in 'city', :with => FFaker::Address.city 
    find(:xpath, '//*[@id="id_state"]/option[2]').click
    fill_in 'postcode', :with => '00000'
    fill_in 'phone_mobile', :with => FFaker::PhoneNumberAU.mobile_phone_number
    fill_in 'alias', :with => FFaker::Address.street_address
    click_button 'submitAccount'
    expect(page).to have_content('Welcome to your account. Here you can manage all of your personal information and orders.')
  end
end