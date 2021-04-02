class AddElementTypeToElement < ActiveRecord::Migration[4.2]
  def change
    add_column :elements, :element_type, :string
  end
end
