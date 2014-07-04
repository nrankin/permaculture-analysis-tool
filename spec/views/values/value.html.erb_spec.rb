require 'rails_helper'

RSpec.describe "values/_value", :type => :view do
  before(:each) do
    @element = assign(:element, FactoryGirl.build(:element, name:'ObserveAndInteract', id: 1, element_type: 'Principle'))
    @value = assign(:value, FactoryGirl.build(:value, element: @element, value: 45))
  end
  it "should display 'Observe & Interact'" do
    render @value
    expect(rendered).to include('Observe &amp; Interact')
  end
  pending it "should have a slider for 'Observe & Interact'"
end