class Usage < ActiveRecord::Base
  belongs_to :snapshot
  belongs_to :principle

end
