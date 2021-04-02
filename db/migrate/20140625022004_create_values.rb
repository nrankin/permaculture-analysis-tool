class CreateValues < ActiveRecord::Migration[4.2]
  def change
    create_table :usages do |t|
      t.integer :value
      t.references :value_set, index: true

      t.timestamps
    end
  end
end
