class CreateElements < ActiveRecord::Migration[4.2]
  def change
    create_table :elements do |t|
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
