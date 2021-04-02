class AddElementIdToValue < ActiveRecord::Migration[4.2]
  def change
    add_reference :values, :element, index: true
  end
end
