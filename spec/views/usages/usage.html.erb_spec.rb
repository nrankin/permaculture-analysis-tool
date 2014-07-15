require 'rails_helper'


RSpec.describe "usages/_usage", :type => :view do
  before(:each) do
    @principle = assign(:principle, FactoryGirl.build(:principle, name:'ObserveAndInteract', id: 1, principle_type: 'Principle'))
    @usage = assign(:usage, FactoryGirl.build(:usage, principle: @principle, value: 45))
  end

  it "should display 'Observe & Interact'" do
    render @usage
    expect(rendered).to include('Observe &amp; Interact')
  end
  pending it "should have a slider for 'Observe & Interact'"
end