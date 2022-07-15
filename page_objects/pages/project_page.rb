class ProjectPage < SitePrism::Page
  element :notification, 'div[data-testid="alert-info"]'
  element :sidebar_project_info_button, 'a[data-qa-menu-item="Project information"]'
  element :members_page_button, '#js-onboarding-members-link', visible: :all
end
