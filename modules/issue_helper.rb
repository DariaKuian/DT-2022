module IssueHelper
  def create_issue
    @new_issue_page = NewIssuePage.new
    @new_issue_page.title_field.set FFaker::Random.rand.to_s
    @new_issue_page.create_issue_button.click
  end

  def assign_issue(username)
    @issues_page = IssuesPage.new
    @issues_page.issuable_sidebar.assignee_block.edit_link.click
    @issues_page.issuable_sidebar.assignee_block.dropdown_input_field.set username
    @issues_page.issuable_sidebar.assignee_block.find('div[data-qa-selector="dropdown_list_content"] span.dropdown-menu-user-username', text: '@'+username).click
    expect(@issues_page.issuable_sidebar.assignee_block.find('div[data-testid="expanded-assignee"] a div.gl-line-height-normal div').text).to include '@'+username
  end
end