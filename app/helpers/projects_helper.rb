module ProjectsHelper
  def latest_snapshot_date(project)
    latest_value_set(project).snapshot
  end
  def latest_value_set(project)
    ValueSet.where(project_id: project.id).order('snapshot DESC').first
  end
end
