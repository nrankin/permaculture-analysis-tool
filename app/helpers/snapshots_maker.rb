module SnapshotsMaker
 include UsagesMaker
  def create_initial_snapshot(project)
    snapshot = project.snapshots.create({name: t('snapshot.initial.name'),snapshot_time: DateTime.now})
    create_initial_usages(snapshot)
  end
end