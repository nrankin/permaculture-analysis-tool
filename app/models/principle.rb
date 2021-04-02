class Principle < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :usages
end
