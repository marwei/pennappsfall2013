class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :message_subject
      t.string :message_body

      t.timestamps
    end
  end
end
