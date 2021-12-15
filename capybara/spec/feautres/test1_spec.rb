require 'spec_helper'

feature 'Visit The-Internet Home Page' do
  background do
    visit '/'
  end

  scenario 'Title: Welcome to the-internet' do
    expect(page).to have_content('Welcome to the-internet')
    expect(page).to have_css('h1', text: 'Welcome to the-internet')
  end
end