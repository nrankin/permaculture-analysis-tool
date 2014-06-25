class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :value
      t.references :value_set, index: true

      t.timestamps
    end
  end
end
