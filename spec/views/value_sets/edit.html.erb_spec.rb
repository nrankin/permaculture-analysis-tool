require 'rails_helper'

RSpec.describe "value_sets/edit", :type => :view do
  before(:each) do
      @value_set = assign(:value_set1, FactoryGirl.create(:value_set))
      @project = @value_set.project
  end

  it "renders the edit value_set form" do
    render

    assert_select "form[action=?][method=?]", project_value_set_path(@project, @value_set), "post" do
    end
  end
end
