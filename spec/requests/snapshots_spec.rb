require 'rails_helper'

RSpec.describe "ValueSets", :type => :request do

  before(:each) do
    @snapshot = FactoryGirl.create(:snapshot)

  end

  describe "GET /project/snapshot" do
    it "works! (now write some real specs)" do
      get project_snapshot_path @snapshot.project,@snapshot
      expect(response.status).to be(200)
    end
  end
end
