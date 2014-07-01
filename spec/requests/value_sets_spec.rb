require 'rails_helper'

RSpec.describe "ValueSets", :type => :request do

  before(:each) do
    @value_set = FactoryGirl.create(:value_set)

  end
  describe "GET /project/value_set" do
    it "works! (now write some real specs)" do
      get project_value_set_path @value_set.project,@value_set
      expect(response.status).to be(200)
    end
  end
end
