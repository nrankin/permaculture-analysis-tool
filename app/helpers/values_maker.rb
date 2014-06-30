module ValuesMaker
  def create_initial_values(value_set)
    Element.all.each do |element|
      value_set.values.create({element_id: element.id})
    end
  end

end