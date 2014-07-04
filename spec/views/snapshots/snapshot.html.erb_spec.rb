require 'rails_helper'

RSpec.describe "snapshots/_snapshot", :type => :view do
  SNAPSHOT_DATE = DateTime.new(2014,06,22,1,0,5)
  before(:each) do
    @snapshot = assign(:snapshot, FactoryGirl.create(:snapshot, snapshot_time: SNAPSHOT_DATE))
    assign(:project, @snapshot.project)
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