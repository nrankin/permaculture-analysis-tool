module ValueSetMaker
 include ValuesMaker
  def create_initial_value_set(project)
    value_set = project.value_sets.create({name: t('snapshot.initial.name'),snapshot: DateTime.now})
    create_initial_values(value_set)
  end
end