require 'spec_helper'

feature 'Visit The-Internet Home Page' do
  background do
    visit '/index.php?controller=authentication&back=my-account'
    @email = "test1519@email.com"
    @password = "123456789"
    find(:xpath,'//*[@id="email"]').set(@email)
    fill_in 'passwd', :with => @password
    click_button 'SubmitLogin'
  end

  scenario 'verify that orders page is empty' do
    click_on 'My orders'
    expect(page).to have_content 'You have not placed any orders.'
  end
end