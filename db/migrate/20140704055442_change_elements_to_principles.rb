class ChangeElementsToPrinciples < ActiveRecord::Migration[4.2]
  def change
    rename_table :elements, :principles
  end
end
