class IssueActions < SitePrism::Section
  element :button, 'button.dropdown-toggle '
  element :new_related_issue_link, 'ul.dropdown-menu li:nth-child(1) a'
end
