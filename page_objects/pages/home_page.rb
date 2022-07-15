class HomePage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me'

  element :create_project_button, '#content-body > .container > div.gl-display-flex > a:nth-child(1)'
end
