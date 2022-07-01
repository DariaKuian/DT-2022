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

Given(/^I register 'Project Owner' user via 'API'$/) do
  @project_owner = User.new
  @project_owner.position PROJECT_OWNER_LABEL
  register_user_via_api @project_owner

end

And(/^I see this 'Project Owner' user is registered via 'API'$/) do
  APIHelper::get_user @project_owner.username
  get_user_via_api @project_owner
  save_user_to_file @project_owner
end

And(/^I register 'Developer' user via 'API'$/) do
  @developer = User.new
  @developer.position DEVELOPER_LABEL
  register_user_via_api @developer
end

And(/^I see this 'Developer' user is registered via 'API'$/) do
  APIHelper::get_user @developer.username
  get_user_via_api @developer
  save_user_to_file @developer
end

def register_user_via_api(user)
  res = APIHelper::sign_up user
  expect(res.code).to eql 201
end

def get_user_via_api(user)
  res = APIHelper::get_user user.username
  expect(res.code).to eql 200
  fetched = OpenStruct.new(JSON.parse(res.body)[0])
  expect(user == fetched).to be_truthy
end

def save_user_to_file(user)
  File.open(USERS_FILENAME, 'a') { |file| file.write(user.to_json + "\n") }
end