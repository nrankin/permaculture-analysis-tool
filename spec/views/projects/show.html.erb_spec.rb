require 'rails_helper'

RSpec.describe "projects/show", :type => :view do
  before(:each) do
    @project = assign(:project, FactoryGirl.build(:project))
  end

  it "renders attributes in <p>" do
    render
  end
end
