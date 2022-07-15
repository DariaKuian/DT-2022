class ProjectMembersPage < SitePrism::Page
  element :invite_members_button, 'button[data-qa-selector="invite_members_button"]'
  element :invite_members_search_field, 'input[data-qa-selector="members_token_select_input"]'
  element :access_level_dropdown, 'div[data-qa-selector="access_level_dropdown"]'
  element :developer_role_option_button, 'div[data-qa-selector="access_level_dropdown"] .dropdown-menu li.gl-new-dropdown-item:nth-child(3) button'
  element :invite_button, 'button[data-qa-selector="invite_button"]'
  element :toaster_bottom_left, '#b-toaster-bottom-left .toast-body', text: 'Members were successfully added'
  section :header, Header, 'header[data-qa-selector="navbar"]'

  def member_option_with_username_button(username)
    find('span.gl-avatar-labeled-sublabel', text: username).ancestor('button')
  end
end