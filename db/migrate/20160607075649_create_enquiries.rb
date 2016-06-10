class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :parent_type, null: false
      t.integer :parent_id, null: false
      t.string :title
      t.text :message
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :enquiries, [:parent_type, :parent_id]
  end
end
