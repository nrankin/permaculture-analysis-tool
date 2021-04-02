class ChangeElementIdToPrinciplesId < ActiveRecord::Migration[4.2]
  def change
    rename_column :usages, :element_id, :principle_id
  end
end
