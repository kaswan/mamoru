class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :relation_type
      t.integer :relation_id
      t.string :parent_type, null: false
      t.integer :parent_id, null: false
      t.boolean :deleted, :default => false

      t.timestamps null: false
    end
    add_index :attachments, [:relation_type, :relation_id]
    add_index :attachments, [:parent_type, :parent_id]
  end
end
