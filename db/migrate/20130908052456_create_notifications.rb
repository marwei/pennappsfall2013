class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :message
      t.integer :message_received
      t.timestamp :message_received_timestamp

      t.timestamps
    end

    add_index :notifications, :sender_id
    add_index :notifications, :receiver_id
    add_index :notifications, [:sender_id, :receiver_id]
    add_index :notifications, :created_at
  end
end
