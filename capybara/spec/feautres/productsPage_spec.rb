require 'spec_helper'

feature 'Visit The Product Page' do
  background do
    visit '/index.php?id_category=8&controller=category'
  end
  scenario 'verify that user can add product to cart' do
    all('.button.ajax_add_to_cart_button>span:nth-child(1)').first().click()
    expect(page).to have_content('Product successfully added to your shopping cart')
  end
  scenario 'verify that user can add product and check order summary' do
    all('.button.ajax_add_to_cart_button>span:nth-child(1)').first().click()
    expect(page).to have_content('Product successfully added to your shopping cart')
    click_on 'Proceed to checkout'
    expect(page).to have_content 'SHOPPING-CART SUMMARY'
    expect(page).to have_content 'Printed Dress'
  end
  scenario 'verify that user can add product and checkout it' do
    all('.button.ajax_add_to_cart_button>span:nth-child(1)').first().click()
    expect(page).to have_content('Product successfully added to your shopping cart')
    click_on 'Proceed to checkout'
    expect(page).to have_content 'SHOPPING-CART SUMMARY'
    expect(page).to have_content 'Printed Dress'
    click_on 'Proceed to checkout'
    expect(page).to have_content 'AUTHENTICATION'
  end

end
