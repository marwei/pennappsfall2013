class WtfAgain < ActiveRecord::Migration
  def change
  	remove_index :projects, :skill_id
  	remove_column :projects, :skill_id, :integer
  end
end
