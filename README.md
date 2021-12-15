# What is  Capybara?
Capybara is a Ruby library (also referred to as a gem) helps you test web applications by simulating how a real user would interact with your app.

Capybara supports Selenium 3.5+ (Webdriver). In order to use Selenium, you will need to install the selenium-webdriver gem, and add it to your Gemfile if you're using bundler.
```
gem 'selenium-webdriver'
```
# How to install Capybara? 
1. Install Ruby.
2. Add Capybara gem to your Gemfile and run bundle install:
```
gem 'capybara'
```
3. If the application that you are testing is a Rails app, install Rails add this line to your test helper file:
```
require 'capybara/rails'
```
4. To use Rspec, load RSpec 3.5+ support by adding the following line (typically to your spec_helper.rb file):
```
require 'capybara/rspec'
```
5. Write you test file and run it using this command and follow the same naming convension for the test file:
```
bundle exec rspec spec/features/test_file_name_spec.rb
```
