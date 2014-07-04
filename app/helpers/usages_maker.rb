module UsagesMaker
  def create_initial_usages(snapshot)
    Principle.all.each do |principle|
      snapshot.usages.create({principle_id: principle.id})
    end
  end

end