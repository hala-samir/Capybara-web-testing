require 'spec_helper'

feature 'Visit Product Page' do
  background do
    visit '/index.php?id_category=8&controller=category'
    all('.button.ajax_add_to_cart_button>span:nth-child(1)').first().click()
  end
  context 'products' do
    scenario 'add product to cart' do
      expect(page).to have_content('Product successfully added to your shopping cart')
    end

    scenario 'add product and check order summary' do
      click_on 'Proceed to checkout'
      expect(page).to have_content 'SHOPPING-CART SUMMARY'
      expect(page).to have_content 'Printed Dress'
    end
    
    scenario 'add product and check it out' do
      click_on 'Proceed to checkout'
      expect(page).to have_content 'SHOPPING-CART SUMMARY'
      expect(page).to have_content 'Printed Dress'
      click_on 'Proceed to checkout'
      expect(page).to have_content 'AUTHENTICATION'
    end

    scenario 'checkout from Cart icon' do
      find(:css, '.continue.btn.btn-default').click()
      find(:css, '.shopping_cart').click()
      find(:css, '.shopping_cart>a').click()
      expect(page).to have_content'SHOPPING-CART SUMMARY'
    end

    scenario 'sort products'do
      visit '/index.php?controller=prices-drop'
      select('Price: Lowest first',from:'selectProductSort', visible:false)
      expect(page).to have_current_path('http://automationpractice.com/index.php?controller=prices-drop&orderby=price&orderway=asc')
      @price1  = execute_script("Number($('.price.product-price')[1].textContent.replace(/[^0-9\.-]+/g,""));")
      @price2 = execute_script('Number($(".price.product-price")[2].textContent.replace(/[^0-9\.-]+/g,""));')
      expect(@price1).to be <= @price2
    end
  end
end
