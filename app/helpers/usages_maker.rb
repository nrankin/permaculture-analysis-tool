module UsagesMaker
  def create_initial_usages(snapshot)
    #todo raise an error if there aren't 12 principles there
    Principle.all.each do |principle|
      snapshot.usages.create({principle_id: principle.id})
    end
  end

end