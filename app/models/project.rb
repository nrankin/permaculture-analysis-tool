class Project < ActiveRecord::Base
  has_many :snapshots, :dependent => :destroy
  has_many :usages, through: :snapshots
  validates :name, presence: true
end
