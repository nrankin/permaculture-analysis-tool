class RenameElementTypeToPrincipleType < ActiveRecord::Migration[4.2]
  def change
    rename_column :principles, :element_type, :principle_type
  end
end
