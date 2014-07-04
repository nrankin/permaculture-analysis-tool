class Project < ActiveRecord::Base
  has_many :snapshots, :dependent => :destroy
  has_many :values, through: :snapshots
  validates :name, presence: true
end
