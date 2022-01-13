require 'spec_helper'

feature 'the home page' do
  background do
    visit '/'
  end
  context'home page' do
    scenario 'visit home page' do
      expect(page).to have_content('Automation Practice Website')
    end

    scenario 'search for product'  do
      fill_in 'search_query_top', with: 'dress'
      find(:xpath, '//*[@id="searchbox"]/button').click
      expect(page).to have_content('7 results have been found.')
      expect((all('.product-container').length)==7)
    end
  end
end