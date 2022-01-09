require 'spec_helper'

feature 'Registration' do
  background do
    visit '/index.php?controller=authentication&back=my-account'
    @email = "test1525@email.com"
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
    login(@email,@password) 
    expect(page).to have_content('Welcome to your account. Here you can manage all of your personal information and orders.')
  end

  scenario 'Verify that wrong credentials can not login' do
    login(FFaker::Internet.email,FFaker::Internet.password)
    expect(page).to have_content('Authentication failed.')
  end
  
  scenario 'verify that user can retrieve password' do
    click_on 'Forgot your password?'
    find(:xpath,'//*[@id="email"]').set(@email)
    find(:xpath,'//*[@id="form_forgotpassword"]/fieldset/p/button').click
    expect(page).to have_content('A confirmation email has been sent to your address')
  end
end