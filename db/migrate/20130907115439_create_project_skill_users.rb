class CreateProjectSkillUsers < ActiveRecord::Migration
  def change
    create_table :project_skill_users do |t|
      t.integer :project_id
      t.integer :skill_id
      t.integer :user_id
      t.integer :user_id_accepted
      t.integer :owner_id

      t.timestamps
    end
  end
end
