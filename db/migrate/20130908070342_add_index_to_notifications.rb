class AddIndexToNotifications < ActiveRecord::Migration
  def change
    add_index :notifications, :user_id
  end
end
