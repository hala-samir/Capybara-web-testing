require 'spec_helper'

feature 'Orders Page' do
  background do
    visit '/index.php?controller=authentication&back=my-account'
    @email = "test1519@email.com"
    @password = "123456789"
    login(@email,@password)
  end

  scenario 'verify that orders page is empty' do
    click_on 'My orders'
    expect(page).to have_content 'You have not placed any orders.'
  end
  
  scenario 'verify that user can add a new order' do
    visit '/index.php?id_category=8&controller=category'
    all('.button.ajax_add_to_cart_button>span:nth-child(1)').first().click()
    click_on 'Proceed to checkout'
    click_on 'Proceed to checkout'
    click_on 'Proceed to checkout'
    find(:xpath, '//*[@id="cgv"]', visible: false).click()
    click_on 'Proceed to checkout'
    click_on 'Pay by bank wire'
    expect(page).to have_content('You have chosen to pay by bank wire. Here is a short summary of your order')
    click_on 'I confirm my order'
    expect(page).to have_content('Your order on My Store is complete')
  end
end