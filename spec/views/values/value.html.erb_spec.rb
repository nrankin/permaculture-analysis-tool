require 'rails_helper'

RSpec.describe "values/_value", :type => :view do
  before(:each) do
    @principle = assign(:principle, FactoryGirl.build(:principle, name:'ObserveAndInteract', id: 1, principle_type: 'Principle'))
    @value = assign(:value, FactoryGirl.build(:value, principle: @principle, value: 45))
  end
  it "should display 'Observe & Interact'" do
    render @value
    expect(rendered).to include('Observe &amp; Interact')
  end
  pending it "should have a slider for 'Observe & Interact'"
end