Given(/^Gitlab sign in page is opened$/) do
  load_sign_in_page
end

When(/^I sign in as a preregistered user$/) do
  user_credentials = JSON.parse(File.read('users.json'))
  sign_in_user user_credentials['username'], user_credentials['password']
end

Then(/^I see that new user is logged in$/) do
  @welcome_page = WelcomePage.new
  expect(@welcome_page.welcome_msg.text).to include 'Welcome to GitLab'
end

When(/^I log in to gitlab with 'Project Owner' user$/) do
  load_sign_in_page
  r = get_user_from_file PROJECT_OWNER_LABEL
  sign_in_user r.username, r.password
  # sleep 6000
end

def get_user_from_file(position)
  users = []
  f = File.open(USERS_FILENAME, "r")
  f.each_line {|line| users << line.split("\n") }
  user_data = users.find { |user_data| JSON.parse(user_data[0])["position"] == position }
  expect(user_data.length).to eql 1
  OpenStruct.new(JSON.parse(user_data[0]))
end

def load_sign_in_page
  @sign_in_page = SignInPage.new
  @sign_in_page.load
end