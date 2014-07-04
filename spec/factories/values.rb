# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :value do
    value 1
    snapshot
    element
  end
end
