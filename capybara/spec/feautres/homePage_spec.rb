require 'spec_helper'

feature 'Visit The-Internet Home Page' do
  background do
    visit '/'
  end

  scenario 'verify the home page content' do
    expect(page).to have_content('Automation Practice Website')
  end

  scenario 'verify that user can search for product'  do
    fill_in 'search_query_top', with: 'dress'
    find(:xpath, '//*[@id="searchbox"]/button').click
    expect(page).to have_content('7 results have been found.')
    expect((all('.product-container').length)==7)
  end
end