class Project < ActiveRecord::Base
  has_many :snapshots, :dependent => :destroy
  has_many :usages, through: :snapshots
  belongs_to :user
  validates :name, presence: true
end
