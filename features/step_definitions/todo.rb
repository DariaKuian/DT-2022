Then(/^I can see that I have an issue assigned$/) do
  @project_members_page.header.issues_button.click
  @issues_page = IssuesPage.new
  expect(@issues_page).to have_issues
end

When(/^I open the issue$/) do
  @issues_page.issues.issue_link.click
end