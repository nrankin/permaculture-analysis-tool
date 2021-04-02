class CreateValueSets < ActiveRecord::Migration[4.2]
  def change
    create_table :snapshots do |t|
      t.string :name
      t.references :project, index: true
      t.datetime :snapshot

      t.timestamps
    end
  end
end
