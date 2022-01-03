require 'spec_helper'

feature 'Registration' do
  background do
    visit '/index.php?controller=authentication&back=my-account'
    @email = "test1519@email.com"
    @password = "123456789"
  end

  scenario 'verify that user can sign up' do 
    fill_in 'email_create', :with => @email
    click_button 'SubmitCreate'
    fill_in 'customer_firstname', :with => FFaker::Name.first_name
    fill_in 'customer_lastname', :with => FFaker::Name.last_name
    fill_in 'passwd', :with => @password
    fill_in 'address1', :with => FFaker::Address.street_address
    fill_in 'city', :with => FFaker::Address.city 
    find(:xpath, '//*[@id="id_state"]/option[2]').click
    fill_in 'postcode', :with => '00000'
    fill_in 'phone_mobile', :with => FFaker::PhoneNumberAU.mobile_phone_number
    fill_in 'alias', :with => FFaker::Address.street_address
    click_button 'submitAccount'
    expect(page).to have_content('Welcome to your account. Here you can manage all of your personal information and orders.')
    find(:xpath,'//*[@id="header"]/div[2]/div/div/nav/div[2]/a').click
    expect(page).to have_content('AUTHENTICATION')
  end

  scenario 'verify that user can sign in ' do
    find(:xpath,'//*[@id="email"]').set(@email)
    fill_in 'passwd', :with => @password
    click_button 'SubmitLogin'  
    expect(page).to have_content('Welcome to your account. Here you can manage all of your personal information and orders.')
  end

  scenario 'Verify thatwrong credentials can not login' do
    find(:xpath,'//*[@id="email"]').set(FFaker::Internet.email)
    fill_in 'passwd', :with => FFaker::Internet.password
    click_button 'SubmitLogin'  
    expect(page).to have_content('Authentication failed.')
  end
end