class NewNote < SitePrism::Section
  element :note_body, '#note-body'
  element :submit, 'div[data-qa-selector="comment_button"] .split-content-button'
end
