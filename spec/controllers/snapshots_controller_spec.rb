require 'rails_helper'

RSpec.describe SnapshotsController, :type => :controller do

  before(:each) do
    @project = FactoryGirl.create(:project)
    @snapshot = FactoryGirl.create(:snapshot, name: "set name", project: @project)
    @principle1 = FactoryGirl.create(:principle, name:'ObserveAndInteract', id: 1, principle_type: 'Principle')
    @value1 = FactoryGirl.create(:value, snapshot: @snapshot, principle: @principle1, value: 45)
    @principle2 = FactoryGirl.create(:principle, name:'CatchAndStoreEnergy', id: 2, principle_type: 'Principle')
    @value2 = FactoryGirl.create(:value, snapshot: @snapshot, principle: @principle2, value: 30)
  end
 let(:valid_attributes) {
   {'name' => 'Project Inception'}
 }

 let(:valid_session) { {} }

   describe "GET edit" do
     it "assigns the requested snapshot as @snapshot" do
       project = Project.create! :name => "Valid Project"
       snapshot = Snapshot.create! :name => "Snapshot Name", :project => project, :snapshot_time => DateTime.new(2014,06,22,1,0,5)

       get :edit, {:project_id =>  project.to_param, :id => snapshot.to_param}, valid_session
       expect(assigns(:snapshot)).to eq(snapshot)
     end
   end
 describe "PUT update" do

   updatedName = 'Updated Name'
   let(:new_attributes) {
     {'name' => updatedName}
   }
   it "updates the requested value set" do
     put :update, {:project_id => @project.to_param, :id => @snapshot.to_param, :snapshot => new_attributes}, valid_session
     @snapshot.reload
     expect(@snapshot.name).to eql(updatedName)
   end
 end

 describe "PUT update values params" do

   updatedName = 'Updated Name'
   let(:new_attributes) {
     {'name' => updatedName}
   }
   it "updates the requested value set" do

     put :update, {:project_id => @project.to_param, :id => @snapshot.to_param, :snapshot => new_attributes, :values => {:ObserveAndInteract => 20, :CatchAndStoreEnergy => 80} }, valid_session
     @snapshot.reload
     expect(@snapshot.values.first.value).to eql(20)
     expect(@snapshot.values.find_by(principle_id: 2).value).to eql(80)
   end
 end
end
