class ChangeColumnSnapshotToSnapshotDate < ActiveRecord::Migration[4.2]
  def change
    rename_column :snapshots, :snapshot, :snapshot_time
  end
end
