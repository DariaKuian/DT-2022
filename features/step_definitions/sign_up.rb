uid = get_random_string()

Given(/^Gitlab sign up page is opened$/) do
  visit 'https://gitlab.testautomate.me/users/sign_up'
end

When(/^I fill in first name$/) do
  find('#new_user_first_name').set uid
end

And(/^I fill in last name$/) do
  find('#new_user_last_name').set 'Kuian'
end

And(/^I fill in new username$/) do
  find('#new_user_username').set uid
end

And(/^I fill in new email$/) do
  find('#new_user_email').set uid + '@gmail.com'
end

And(/^I fill in new password$/) do
  find('#new_user_password').set '12345678'
end

And(/^I click Register button$/) do
  find('input[data-qa-selector="new_user_register_button"]').click
end

Then(/^I see that user is registered$/) do
  expect(find('#content-body h2').text).to eql "Welcome to GitLab,\n#{uid}!"
  sleep(5)
end