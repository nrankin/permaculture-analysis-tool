class RenameValueSetsToSnapshot < ActiveRecord::Migration[4.2]
  def change
    rename_table :value_sets, :snapshots
  end
end
