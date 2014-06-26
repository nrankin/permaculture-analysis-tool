module ValuesHelper
  def get_element(value)
    Element.find(value.element_id )
  end
end
