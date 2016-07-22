class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :token
      t.string :sender_type
      t.integer :sender_id
      t.string :recipient_type
      t.integer :recipient_id
      t.integer :specialized_field_id
      t.text :remarks
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :closed, default: false

      t.timestamps null: false
    end
  end
end
