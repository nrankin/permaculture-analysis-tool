module ValuesHelper
  def get_principle(value)
    Principle.find(value.principle_id )
  end
end
