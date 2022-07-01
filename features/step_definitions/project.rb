Then(/^I can see 'Create a project' button on the 'Home Page'$/) do
  @home_page = HomePage.new
  expect(@home_page.has_create_project_button?).to be_truthy
  expect(@home_page.create_project_button.find("h3").text).to include 'Create a project'
end

When(/^I create a new blank project$/) do
  @home_page.create_project_button.click
  ProjectHelper::create_blank
end

Then(/^I see that project was successfully created$/) do
  @project_page = ProjectPage.new
  sleep 10
  expect(@project_page.notification.find("span").text).to include 'was successfully created'
end