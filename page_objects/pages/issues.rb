class IssuesPage < SitePrism::Page
  section :issuable_sidebar, IssuableSidebar, '.right-sidebar'
  section :issue_actions, IssueActions, 'div[data-qa-selector="issue_actions_ellipsis_dropdown"]'
  section :issues, Issue, 'ul.issues-list > li'
end
