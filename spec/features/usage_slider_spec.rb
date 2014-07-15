require 'rails_helper'

feature 'sliders are displayed' do
  before(:each) do
    FactoryGirl.create_list(:principle, 12, name: :Principle)
  end
  scenario 'a slider is displayed', :js => true do
    visit new_project_path
    fill_in 'project_name', :with => "newproject"
    click_button 'Create Project'
    expect(page).to have_content("Principle")
  end
end