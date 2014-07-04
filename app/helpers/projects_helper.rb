module ProjectsHelper
  def latest_snapshot_date(project)
    latest_snapshot(project).snapshot_time
  end
  def latest_snapshot(project)
    Snapshot.where(project_id: project.id).order('snapshot_time DESC').first
  end
end
