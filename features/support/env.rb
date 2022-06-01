require 'capybara/cucumber'
require 'rspec/expectations'
require 'selenium-webdriver'

def chrome_options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Before do
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

def get_random_string(length=20)
  source=("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a
  key=""
  length.times{ key += source[rand(source.size)].to_s }
  return key
end