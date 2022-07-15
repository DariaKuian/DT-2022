Then(/^I can see 'Create a project' button on the 'Home Page'$/) do
  @home_page = HomePage.new
  expect(@home_page).to have_create_project_button
  expect(@home_page.create_project_button.find("h3").text).to include 'Create a project'
end

When(/^I create a new blank project$/) do
  @home_page.create_project_button.click
  ProjectHelper::create_blank
end

Then(/^I see that project was successfully created$/) do
  @project_page = ProjectPage.new
  expect(@project_page.notification.find("span").text).to include 'was successfully created'
end

When(/^I open 'Project members' page$/) do
  @project_page.sidebar_project_info_button.hover
  @project_page.members_page_button.click
  @project_members_page = ProjectMembersPage.new
end

Then(/^I can see 'Invite members' button$/) do
  expect(@project_members_page).to have_invite_members_button
end

When(/^I click 'Invite members' button$/) do
  @project_members_page.invite_members_button.click
end

And(/^I can see fill in search field with 'Developer' user name$/) do
  @developer = get_user_from_file DEVELOPER_LABEL
  @project_members_page.invite_members_search_field.set @developer.username
end

Then(/^I can see 'Developer' user is found$/) do
  @option_button = @project_members_page.member_option_with_username_button @developer.username
  @option_button.click
end

When(/^I select Developer role$/) do
  @project_members_page.access_level_dropdown.click
  @project_members_page.developer_role_option_button.click

end

And(/^I click Invite button$/) do
  @project_members_page.invite_button.click
end

Then(/^I can see that 'Developer' user was invited$/) do
  expect(@project_members_page).to have_toaster_bottom_left
end