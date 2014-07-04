module UsagesHelper
  def get_principle(usage)
    Principle.find(usage.principle_id )
  end
end
