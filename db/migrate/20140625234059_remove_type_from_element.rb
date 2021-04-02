class RemoveTypeFromElement < ActiveRecord::Migration[4.2]
  def change
    remove_column :elements, :type, :string
  end
end
