class IssuePage < SitePrism::Page
  section :new_note, NewNote, 'form.new-note'
  element :mark_done_button, 'div[data-testid="sidebar-todo"] button[issuable-type="issue"]'
  element :close_issue_button, 'button[data-qa-selector="close_issue_button"]'
end

