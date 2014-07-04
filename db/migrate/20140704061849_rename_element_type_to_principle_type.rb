class RenameElementTypeToPrincipleType < ActiveRecord::Migration
  def change
    rename_column :principles, :element_type, :principle_type
  end
end
