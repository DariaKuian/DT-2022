class Assignee < SitePrism::Section
  element :edit_link, 'a[data-test-id="edit-link"]'
  element :dropdown_input_field, 'input[data-qa-selector="dropdown_input_field"]'
end

class IssuableSidebar < SitePrism::Section
  section :assignee_block, Assignee, '.qa-assignee-block'
end
