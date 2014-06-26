class AddElementIdToValue < ActiveRecord::Migration
  def change
    add_reference :values, :element, index: true
  end
end
