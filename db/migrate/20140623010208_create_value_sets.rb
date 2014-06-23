class CreateValueSets < ActiveRecord::Migration
  def change
    create_table :value_sets do |t|
      t.string :name
      t.references :project, index: true
      t.datetime :snapshot

      t.timestamps
    end
  end
end
