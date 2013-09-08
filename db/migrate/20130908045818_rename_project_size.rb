class RenameProjectSize < ActiveRecord::Migration
  def change
    rename_column :projects, :size, :user_capacity
  end
end
