class RemedyWtf < ActiveRecord::Migration
  def change
  	remove_index :project_skill_users, :owner_id
  	remove_column :project_skill_users, :owner_id, :integer

  	add_column :projects, :owner_id, :integer
  	add_index :projects, :owner_id, unique: true 
  end
end
