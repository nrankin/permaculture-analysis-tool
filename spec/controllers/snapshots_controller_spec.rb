require 'rails_helper'

RSpec.describe SnapshotsController, :type => :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user

    @project = FactoryGirl.create(:project, user: @user)
    @snapshot = FactoryGirl.create(:snapshot, name: "set name", project: @project)
    @principle1 = FactoryGirl.create(:principle, name:'ObserveAndInteract', id: 1, principle_type: 'Principle')
    @usage1 = FactoryGirl.create(:usage, snapshot: @snapshot, principle: @principle1, value: 45)
    @principle2 = FactoryGirl.create(:principle, name:'CatchAndStoreEnergy', id: 2, principle_type: 'Principle')
    @usage2 = FactoryGirl.create(:usage, snapshot: @snapshot, principle: @principle2, value: 30)
  end
 let(:valid_attributes) {
   {'name' => 'Project Inception'}
 }

 let(:valid_session) { {} }

   describe "GET edit" do
     it "assigns the requested snapshot as @snapshot" do

       get :edit, {:project_id =>  @project.to_param, :id => @snapshot.to_param}, valid_session
       expect(assigns(:snapshot)).to eq(@snapshot)
     end
   end
 describe "PUT update" do

   updatedName = 'Updated Name'
   let(:new_attributes) {
     {'name' => updatedName}
   }
   it "updates the requested usage" do
     put :update, {:project_id => @project.to_param, :id => @snapshot.to_param, :snapshot => new_attributes}, valid_session
     @snapshot.reload
     expect(@snapshot.name).to eql(updatedName)
   end
 end

 describe "PUT update usages params" do

   updatedName = 'Updated Name'
   let(:new_attributes) {
     {'name' => updatedName}
   }
   it "updates the requested usage" do

     put :update, {:project_id => @project.to_param, :id => @snapshot.to_param, :snapshot => new_attributes, :usages => {:ObserveAndInteract => 20, :CatchAndStoreEnergy => 80} }, valid_session
     @snapshot.reload
     expect(@snapshot.usages.first.value).to eql(20)
     expect(@snapshot.usages.find_by(principle_id: 2).value).to eql(80)
   end
 end
end
