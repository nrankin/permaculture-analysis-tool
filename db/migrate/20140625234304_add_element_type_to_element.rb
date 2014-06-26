class AddElementTypeToElement < ActiveRecord::Migration
  def change
    add_column :elements, :element_type, :string
  end
end
