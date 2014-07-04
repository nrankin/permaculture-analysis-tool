class RenameValueSetsToSnapshot < ActiveRecord::Migration
  def change
    rename_table :value_sets, :snapshots
  end
end
