FactoryGirl.define do
  factory :project do
    name 'Permaculture Home Design'
    user
    created_at DateTime.now
  end

end