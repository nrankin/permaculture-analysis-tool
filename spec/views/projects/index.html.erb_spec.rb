require 'rails_helper'

RSpec.describe "projects/index", :type => :view do
  before(:each) do
    assign(:projects, [
        FactoryGirl.build(:project, :id => 1),
        FactoryGirl.build(:project, :id => 2)
    ])
  end

  it "renders a list of projects" do
    render
  end
end
