module ProjectsHelper
  def latest_snapshot_date(project)
    ValueSet.where(project_id: project.id).order('snapshot DESC').first.snapshot
  end
end
