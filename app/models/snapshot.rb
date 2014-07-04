class Snapshot < ActiveRecord::Base
  belongs_to :project
  has_many :usages, :dependent => :destroy
  has_many :principles, through: :usages
end
