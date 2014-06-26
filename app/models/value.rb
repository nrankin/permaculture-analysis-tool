class Value < ActiveRecord::Base
  belongs_to :value_set
  belongs_to :element
  def element_name(value)
     if value.element.exists?
       value.element.name
     end

  end
end
