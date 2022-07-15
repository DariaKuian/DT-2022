When(/^I create new issue$/) do
  @project_members_page.header.new_dropdown.root_element.click
  @project_members_page.header.new_dropdown.new_issue_link.click
  create_issue
end

Then(/^I can see that I can assign it to a 'Developer' user$/) do
  assign_issue @developer.username
end

Then(/^I can leave a text comment$/) do
  @issue_page = IssuePage.new
  @issue_page.new_note.note_body.set FFaker::Random.rand.to_s
  @issue_page.new_note.submit.click
end

And(/^I can 'Mark as done'$/) do
  @issue_page.mark_done_button.click
end

And(/^I can close the issue$/) do
  @issue_page.mark_done_button.click
end

And(/^I can 'Add a to do'$/) do
  @issues_page.issue_actions.button.click
  @issues_page.issue_actions.new_related_issue_link.click
  create_issue
end