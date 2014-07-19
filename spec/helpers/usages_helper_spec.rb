require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsagesHelper. For example:
#
# describe UsagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsagesHelper, :type => :helper do
  it 'returns the Principle for the supplied usage' do
    test_name = 'test_name'
    principle = FactoryGirl.create(:principle, name: test_name)
    usage = FactoryGirl.create(:usage, principle: principle)
    expect(get_principle(usage).name).to eql(test_name)
  end
end
