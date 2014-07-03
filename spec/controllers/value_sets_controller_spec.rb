require 'rails_helper'

RSpec.describe ValueSetsController, :type => :controller do

  before(:each) do
    @project = FactoryGirl.create(:project)
    @value_set = FactoryGirl.create(:value_set, name: "set name", project: @project)
    @element1 = FactoryGirl.create(:element, name:'ObserveAndInteract', id: 1, element_type: 'Principle')
    @value1 = FactoryGirl.create(:value, value_set: @value_set, element: @element1, value: 45)
    @element2 = FactoryGirl.create(:element, name:'CatchAndStoreEnergy', id: 2, element_type: 'Principle')
    @value2 = FactoryGirl.create(:value, value_set: @value_set, element: @element2, value: 30)
  end
 let(:valid_attributes) {
   {'name' => 'Project Inception'}
 }

 let(:valid_session) { {} }

   describe "GET edit" do
     it "assigns the requested value_set as @value_set" do
       project = Project.create! :name => "Valid Project"
       value_set = ValueSet.create! :name => "Snapshot Name", :project => project, :snapshot => DateTime.new(2014,06,22,1,0,5)

       get :edit, {:project_id =>  project.to_param, :id => value_set.to_param}, valid_session
       expect(assigns(:value_set)).to eq(value_set)
     end
   end
 describe "PUT update" do

   updatedName = 'Updated Name'
   let(:new_attributes) {
     {'name' => updatedName}
   }
   it "updates the requested value set" do
     put :update, {:project_id => @project.to_param, :id => @value_set.to_param, :value_set => new_attributes}, valid_session
     @value_set.reload
     expect(@value_set.name).to eql(updatedName)
   end
 end

 describe "PUT update values params" do

   updatedName = 'Updated Name'
   let(:new_attributes) {
     {'name' => updatedName}
   }
   it "updates the requested value set" do

     put :update, {:project_id => @project.to_param, :id => @value_set.to_param, :value_set => new_attributes, :ObserveAndInteract => 20, :CatchAndStoreEnergy => 80 }, valid_session
     @value_set.reload
     expect(@value_set.values.first.value).to eql(20)
     expect(@value_set.values.find_by(element_id: 2).value).to eql(80)
   end
 end
end
