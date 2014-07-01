require 'rails_helper'

RSpec.describe ValueSetsController, :type => :controller do

 # before(:each) do
 #   @value_set = FactoryGirl.create(:value_set, snapshot: DateTime.new(2014,06,22,1,0,5))
 #   @project = @value_set.project
 # end
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
end
