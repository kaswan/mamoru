class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :parent_type, null: false
      t.integer :parent_id, null: false
      t.integer :post_type_id
      t.integer :post_category_id
      t.text :message
      t.boolean :pending_status, default: false
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :posts, [:parent_type, :parent_id]
    add_index :posts, :post_type_id
    add_index :posts, :post_category_id
  end
end
