Given(/^Gitlab sign up page is opened$/) do
  @sign_up_page = SignUpPage.new
  @sign_up_page.load
end

When(/^I register user via UI$/) do
  @user = User.new
  sign_up_user @user
end

Then(/^I see that user is registered$/) do
  expect(find('#content-body h2').text).to eql "Welcome to GitLab,\n#{@user.firstname}!"

  #append users only if they were created successfully
  user_credentials = { username: @user.username, password: @user.password }.to_json
  File.open('users.json', 'w') { |file| file.write(user_credentials) }
end