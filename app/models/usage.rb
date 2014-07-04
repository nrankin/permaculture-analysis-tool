class Usage < ActiveRecord::Base
  belongs_to :snapshot
  belongs_to :principle

  def principle_name(usage)
     if usage.principle.exists?
       usage.principle.name
     end

  end
end
