class Value < ActiveRecord::Base
  belongs_to :snapshot
  belongs_to :principle

  def principle_name(value)
     if value.principle.exists?
       value.principle.name
     end

  end
end
