module ProjectHelper
  def self.create_blank
    @new_blank_project_page = NewBlankProjectPage.new
    @new_blank_project_page.create_blank_button.click
    @new_blank_project_page.project_name_field.set FFaker::Random.rand.to_s
    @new_blank_project_page.create_project_button.click
  end
end