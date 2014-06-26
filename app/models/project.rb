class Project < ActiveRecord::Base
  has_many :value_sets, :dependent => :destroy
  has_many :values, through: :value_sets
  validates :name, presence: true
end
