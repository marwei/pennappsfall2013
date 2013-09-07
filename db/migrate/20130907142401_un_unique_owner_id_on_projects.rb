class UnUniqueOwnerIdOnProjects < ActiveRecord::Migration
  def change
  	remove_index :projects, :owner_id
  	add_index :projects, :owner_id
  end
end
