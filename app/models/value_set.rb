class ValueSet < ActiveRecord::Base
  belongs_to :project
  has_many :values, :dependent => :destroy
end
