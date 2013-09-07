class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.boolean :active
      t.boolean :matched
      t.integer :requestor_id
      t.integer :responder_id

      t.timestamps
    end
  end
end
