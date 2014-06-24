require 'rails_helper'

RSpec.describe "projects/show", :type => :view do
  SNAPSHOT_DATE = DateTime.new(2014,06,22,1,0,5)
  before(:each) do
    @value_set = assign(:value_set1, FactoryGirl.create(:value_set, snapshot: SNAPSHOT_DATE))
    @project = @value_set.project
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include("Project Name:")
  end

  it "renders slider for 'Observe & Interact'" do
    render
    expect(rendered).to include('Observe & Interact')
  end

  it "renders the project snapshot date" do
    render
    expect(rendered).to include(SNAPSHOT_DATE.strftime("%F"))
  end

  it "renders the project snapshot time" do
    render
    expect(rendered).to include(SNAPSHOT_DATE.strftime("%T"))
  end

end
