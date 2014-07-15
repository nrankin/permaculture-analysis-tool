require 'rails_helper'

feature 'usages of principles are displayed' do
  before(:each) do
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
    assert page.has_xpath?('//div[@id="ObserveAndInteract"]')
    assert page.has_xpath?('//div[@id="CatchAndStoreEnergy"]')
    assert page.has_xpath?('//div[@id="ObtainAYield"]')
    assert page.has_xpath?('//div[@id="ApplySelfRegulationAndAcceptFeedback"]')
    assert page.has_xpath?('//div[@id="UseAndValueRenewableResourcesAndServices"]')
    assert page.has_xpath?('//div[@id="ProduceNoWaste"]')
    assert page.has_xpath?('//div[@id="DesignFromPatternsToDetails"]')
    assert page.has_xpath?('//div[@id="IntegrateRatherThanSegregate"]')
    assert page.has_xpath?('//div[@id="UseSmallAndSlowSolutions"]')
    assert page.has_xpath?('//div[@id="UseAndValueDiversity"]')
    assert page.has_xpath?('//div[@id="UseEdgesAndValueTheMarginal"]')
    assert page.has_xpath?('//div[@id="CreativelyUseAndRespondToChange"]')

  end
end