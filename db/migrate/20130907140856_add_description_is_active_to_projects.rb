class AddDescriptionIsActiveToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text
    add_column :projects, :is_active, :integer, default: 1
    change_column :projects, :is_full, :integer, default: 0
  end
end
