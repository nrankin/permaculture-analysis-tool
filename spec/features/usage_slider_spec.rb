require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'usages of principles are displayed by sliders' do
  before(:each) do
    #less than ideal, but I really want to check that 12 sliders will be displayed
    FactoryGirl.create(:principle, name: :ObserveAndInteract)
    FactoryGirl.create(:principle, name: :CatchAndStoreEnergy)
    FactoryGirl.create(:principle, name: :ObtainAYield)
    FactoryGirl.create(:principle, name: :ApplySelfRegulationAndAcceptFeedback)
    FactoryGirl.create(:principle, name: :UseAndValueRenewableResourcesAndServices)
    FactoryGirl.create(:principle, name: :ProduceNoWaste)
    FactoryGirl.create(:principle, name: :DesignFromPatternsToDetails)
    FactoryGirl.create(:principle, name: :IntegrateRatherThanSegregate)
    FactoryGirl.create(:principle, name: :UseSmallAndSlowSolutions)
    FactoryGirl.create(:principle, name: :UseAndValueDiversity)
    FactoryGirl.create(:principle, name: :UseEdgesAndValueTheMarginal)
    FactoryGirl.create(:principle, name: :CreativelyUseAndRespondToChange)
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  scenario 'a slider is displayed', :js => true do
    visit new_project_path
    fill_in 'project_name', :with => "newproject"
    click_button 'Create Project'
    expect(page).to have_content('Observe & Interact')
  end

  scenario 'all sliders are displayed' do
    visit new_project_path
    fill_in 'project_name', :with => 'newproject'
    click_button 'Create Project'
    #less than ideal to have multiple asserts in one scenario, but I really want to check that a slider will be displayed for each
    # of the principles and for test suite speed I don't want to have to navigate to the page repeatedly to do them seperately
    Principle.all.each do |principle|
      assert page.has_xpath?('//div[@id="' + principle.name + '"]')
    end
  end

  scenario 'sliders are disabled in view mode', :js => true do
    visit new_project_path
    fill_in 'project_name', :with => 'newproject'
    click_button 'Create Project'
    # Capybara.default_selector = :xpath
    page.assert_selector(:xpath, '//div[@id="usage"] | //div[@class="ui-slider-vertical" | @aria-disabled="true"]', :count => 12)
  end

  scenario 'sliders are enabled in edit mode'
  scenario 'a sliders value can be updated'

end