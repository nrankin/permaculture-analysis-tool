class Snapshot < ActiveRecord::Base
  belongs_to :project
  has_many :values, :dependent => :destroy
  has_many :elements, through: :values
end
