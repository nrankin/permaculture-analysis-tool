class ChangeElementIdToPrinciplesId < ActiveRecord::Migration
  def change
    rename_column :usages, :element_id, :principle_id
  end
end
