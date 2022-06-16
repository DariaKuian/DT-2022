Given(/^Gitlab sign in page is opened$/) do
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end

When(/^I sign in as a preregistered user$/) do
  user_credentials = JSON.parse(File.read('users.json'))
  sign_in_user user_credentials['username'], user_credentials['password']
end

Then(/^I see that new user is logged in$/) do
  @welcome_page = WelcomePage.new
  expect(@welcome_page.welcome_msg.text).to include 'Welcome to GitLab'
end