require 'rails_helper'

RSpec.describe Usage, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:usage)).to be_valid
  end

end
