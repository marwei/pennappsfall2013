class AddIndexToProjectSkillUser < ActiveRecord::Migration
  def change
  	add_index :project_skill_users, :project_id, unique: true
  	add_index :project_skill_users, :owner_id, unique: true
  	add_index	:project_skill_users, :skill_id
  	add_index :project_skill_users, :user_id
  	add_index :project_skill_users, [:skill_id, :user_id], unique: true
  end
end
