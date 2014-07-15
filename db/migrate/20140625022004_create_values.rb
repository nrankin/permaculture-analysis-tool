class CreateValues < ActiveRecord::Migration
  def change
    create_table :usages do |t|
      t.integer :value
      t.references :value_set, index: true

      t.timestamps
    end
  end
end
