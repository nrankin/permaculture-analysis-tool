class Project < ActiveRecord::Base
  has_many :value_sets
  validates :name, presence: true
end
