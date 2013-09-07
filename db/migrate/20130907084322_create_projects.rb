class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.integer :skill_id
    	t.integer :size
    	t.integer :is_full

      t.timestamps
    end

    add_index :projects, :skill_id, unique: true
  end
end
