class ChangeValueSetReferenceToSnapshotReference < ActiveRecord::Migration[4.2]
  def change
    rename_column :usages, :value_set_id, :snapshot_id
  end
end
