class ChangeValueSetReferenceToSnapshotReference < ActiveRecord::Migration
  def change
    rename_column :values, :value_set_id, :snapshot_id
  end
end
