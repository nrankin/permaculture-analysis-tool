class RemoveTypeFromElement < ActiveRecord::Migration
  def change
    remove_column :elements, :type, :string
  end
end
