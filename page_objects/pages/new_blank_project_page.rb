class NewBlankProjectPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/projects/new#blank_project'

  element :create_blank_button, 'a[data-qa-panel-name="blank_project"]'
  element :project_name_field, '#blank-project-pane input[data-qa-selector="project_name"]'
  element :create_project_button, '#blank-project-pane input[data-qa-selector="project_create_button"]'
end
