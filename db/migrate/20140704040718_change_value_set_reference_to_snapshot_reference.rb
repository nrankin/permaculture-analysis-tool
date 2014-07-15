class ChangeValueSetReferenceToSnapshotReference < ActiveRecord::Migration
  def change
    rename_column :usages, :value_set_id, :snapshot_id
  end
end
