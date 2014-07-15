class RenameValuesToUsages < ActiveRecord::Migration
  def change
    rename_table :usages, :usages
  end
end
