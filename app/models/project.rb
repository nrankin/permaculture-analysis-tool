class Project < ActiveRecord::Base
  has_many :value_sets, :dependent => :destroy
  validates :name, presence: true
end
