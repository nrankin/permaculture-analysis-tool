require 'rails_helper'

RSpec.describe "projects/show", :type => :view do

  before(:each) do
    @snapshot = assign(:snapshot, FactoryGirl.create(:snapshot))
    @project = @snapshot.project
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include("Project Name:")
  end

end
