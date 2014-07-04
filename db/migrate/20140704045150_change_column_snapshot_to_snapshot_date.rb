class ChangeColumnSnapshotToSnapshotDate < ActiveRecord::Migration
  def change
    rename_column :snapshots, :snapshot, :snapshot_time
  end
end
