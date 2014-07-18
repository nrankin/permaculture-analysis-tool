require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe "Snapshots", :type => :request do

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    @snapshot = FactoryGirl.create(:snapshot)

  end

  describe "GET /project/snapshot" do
    it "works! (now write some real specs)" do
      get project_snapshot_path @snapshot.project,@snapshot
      expect(response.status).to be(200)
    end
  end
end
