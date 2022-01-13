require 'spec_helper'

feature 'Contact us Page' do
  background do
    visit '/'
    find(:xpath, '//*[@id="contact-link"]').click()
  end
  context 'contact us'do
    scenario 'contactus message not empty' do
      expect(page).to have_content('CUSTOMER SERVICE - CONTACT US')
      click_on 'submitMessage'
      expect(page).to have_content('There is 1 error')
    end

    scenario 'add contact us message' do
      expect(page).to have_content('CUSTOMER SERVICE - CONTACT US')
      fill_in 'message',:with => FFaker::BaconIpsum.sentence
      find(:xpath,'//*[@id="email"]').set(FFaker::Internet.email)
      find(:xpath,'//*[@id="id_contact"]/option[2]').click()
      within('.uploader') do
        page.attach_file('fileUpload', './uploads/download.png', visible: false)
      end
      click_on 'submitMessage'
      expect(page).to have_content('Your message has been successfully sent to our team.')
    end
  end
end