class RenameValuesToUsages < ActiveRecord::Migration
  def change
    rename_table :values, :usages
  end
end
