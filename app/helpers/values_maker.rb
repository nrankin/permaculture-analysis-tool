module ValuesMaker
  def create_initial_values(snapshot)
    Principle.all.each do |principle|
      snapshot.values.create({principle_id: principle.id})
    end
  end

end