FactoryGirl.define do
  factory :project do
    id 1
    name 'Permaculture Home Design'
  end
  factory :value_set do
    project
    name "Inception"
    snapshot "2014-06-20 13:02:08"
  end

end