class AddUserReferenceToProjects < ActiveRecord::Migration[4.2]
  def change
    add_reference :projects, :user, index: true
  end
end
