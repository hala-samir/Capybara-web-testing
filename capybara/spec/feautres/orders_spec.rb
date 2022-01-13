require 'spec_helper'

feature 'Orders Page' do
  background do
    visit '/index.php?controller=authentication&back=my-account'
    @email = "test1540@email.com"
    @password = "123456789"
    login(@email,@password)
  end
  describe 'orders'do
    it 'orders page is empty' do
      click_on 'My orders'
      expect(page).to have_content 'You have not placed any orders.'
    end
    
    scenario 'order paid with bank wire' do
      add_product_check_it_out
      pay_by_bank_wire
      expect(page).to have_content('You have chosen to pay by bank wire. Here is a short summary of your order')
      confirm_order
      expect(page).to have_content('Your order on My Store is complete')
    end

    scenario 'order paid with bank check ' do
      add_product_check_it_out
      pay_by_check
      expect(page).to have_content('You have chosen to pay by check. Here is a short summary of your order')
      confirm_order
      expect(page).to have_content('Your order on My Store is complete')
    end
  end
end