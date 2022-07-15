require 'capybara/cucumber'
require 'require_all'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'
require 'rest-client'
require 'oauth'

require_all 'models'
require_all 'modules'
require_all 'page_objects/sections'
require_all 'page_objects/pages'

PROJECT_OWNER_LABEL = 'Project Owner'
DEVELOPER_LABEL = 'Developer'
USERS_FILENAME = 'users.txt'

def chrome_options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
end

Before do
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
end

After do
  File.delete(USERS_FILENAME) if File.exist?(USERS_FILENAME)
end

World(FeatureHelper)
World(IssueHelper)

RestClient.add_before_execution_proc do |req, params|
  puts params
end