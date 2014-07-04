class ChangeElementsToPrinciples < ActiveRecord::Migration
  def change
    rename_table :elements, :principles
  end
end
