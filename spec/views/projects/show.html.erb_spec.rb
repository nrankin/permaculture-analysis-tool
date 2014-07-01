require 'rails_helper'

RSpec.describe "projects/show", :type => :view do

  before(:each) do
    @value_set = assign(:value_set, FactoryGirl.create(:value_set))
    @project = @value_set.project
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include("Project Name:")
  end
end
