require 'rails_helper'

RSpec.describe "snapshots/edit", :type => :view do
  before(:each) do
      @snapshot = assign(:snapshot1, FactoryGirl.create(:snapshot))
      @project = @snapshot.project
  end

  it "renders the edit snapshot form" do
    render

    assert_select "form[action=?][method=?]", project_snapshot_path(@project, @snapshot), "post" do
    end
  end
end
