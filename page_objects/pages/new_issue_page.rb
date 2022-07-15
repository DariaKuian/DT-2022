class NewIssuePage < SitePrism::Page
  element :title_field, '#issue_title'
  element :create_issue_button, 'input[data-qa-selector="issuable_create_button"]'
end
