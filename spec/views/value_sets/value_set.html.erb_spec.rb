require 'rails_helper'

RSpec.describe "value_sets/_value_set", :type => :view do

  before(:each) do
    @value_set = assign(:value_set, FactoryGirl.create(:value_set, snapshot: SNAPSHOT_DATE))
    assign(:project, @value_set.project)
  end

  pending it "should display a save button"


end