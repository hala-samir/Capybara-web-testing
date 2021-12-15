require 'spec_helper'

feature 'Visit The-Internet Home Page' do
  background do
    visit '/'
  end

  scenario 'Title: Welcome to the-internet' do
    expect(page).to have_content('Automation Practice Website')
  end
end