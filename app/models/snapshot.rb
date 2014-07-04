class Snapshot < ActiveRecord::Base
  belongs_to :project
  has_many :values, :dependent => :destroy
  has_many :principles, through: :values
end
