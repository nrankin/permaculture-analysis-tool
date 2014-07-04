class ChangeElementIdToPrinciplesId < ActiveRecord::Migration
  def change
    rename_column :values, :element_id, :principle_id
  end
end
