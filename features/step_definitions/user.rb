When(/^I register user via UI$/) do
  @user = User.new
  sign_up_user @user
end

Given(/^I register 'Project Owner' user via 'API'$/) do
  @project_owner = User.new
  @project_owner.position PROJECT_OWNER_LABEL
  register_user_via_api @project_owner
end

And(/^I register 'Developer' user via 'API'$/) do
  @developer = User.new
  @developer.position DEVELOPER_LABEL
  register_user_via_api @developer
end

def register_user_via_api(user)
  res = APIHelper::sign_up user
  expect(res.code).to eql 201
end

Then(/^I can delete 'Project Owner' user via API$/) do
  res = APIHelper::delete @project_owner
  expect(res.code).to eql 204
end

And(/^I can delete 'Developer' user via API$/) do
  res = APIHelper::delete @developer
  expect(res.code).to eql 204
end