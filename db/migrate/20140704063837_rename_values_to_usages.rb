class RenameValuesToUsages < ActiveRecord::Migration[4.2]
  def change
    rename_table :usages, :usages
  end
end
