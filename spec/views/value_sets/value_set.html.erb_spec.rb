require 'rails_helper'

RSpec.describe "value_sets/_value_set", :type => :view do
  SNAPSHOT_DATE = DateTime.new(2014,06,22,1,0,5)
  before(:each) do
    @value_set = assign(:value_set, FactoryGirl.create(:value_set, snapshot: SNAPSHOT_DATE))
    assign(:project, @value_set.project)
  end

  it "renders the value set snapshot date" do
    render
    expect(rendered).to include(SNAPSHOT_DATE.strftime("%F"))
  end

  it "renders the value set snapshot time" do
    render
    expect(rendered).to include(SNAPSHOT_DATE.strftime("%T"))
  end


end