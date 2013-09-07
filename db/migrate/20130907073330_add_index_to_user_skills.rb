class AddIndexToUserSkills < ActiveRecord::Migration
  def change
  	add_index :user_skills, :user_id
  	add_index :user_skills, :skill_id
  	add_index :user_skills, [:user_id, :skill_id], unique: true
  end
end
