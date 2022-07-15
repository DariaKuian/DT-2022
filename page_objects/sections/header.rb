class NewDropdown < SitePrism::Section
  element :new_issue_link, 'a[data-qa-selector="new_issue_link"]'
end

class Header < SitePrism::Section
  section :new_dropdown, NewDropdown, '.header-new'
  element :todo_link, 'a[data-qa-selector="todos_shortcut_button"]'
  element :issues_button, 'a[data-qa-selector="issues_shortcut_button"]'
end
