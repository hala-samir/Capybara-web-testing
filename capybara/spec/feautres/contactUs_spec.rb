require 'spec_helper'

feature 'Visit The-Internet Home Page' do
  background do
    visit '/'
    find(:xpath, '//*[@id="contact-link"]').click()
  end

  scenario 'verify user can not send empty contactus message' do
    expect(page).to have_content('CUSTOMER SERVICE - CONTACT US')
    click_on 'submitMessage'
    expect(page).to have_content('There is 1 error')
  end

  scenario 'verify user can send message to contact us' do
    expect(page).to have_content('CUSTOMER SERVICE - CONTACT US')
    fill_in 'message',:with => FFaker::BaconIpsum.sentence
    find(:xpath,'//*[@id="email"]').set(FFaker::Internet.email)
    find(:xpath,'//*[@id="id_contact"]/option[2]').click()
    click_on 'submitMessage'
    expect(page).to have_content('Your message has been successfully sent to our team.')
  end
end