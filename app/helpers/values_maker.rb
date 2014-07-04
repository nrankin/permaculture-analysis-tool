module ValuesMaker
  def create_initial_values(snapshot)
    Element.all.each do |element|
      snapshot.values.create({element_id: element.id})
    end
  end

end