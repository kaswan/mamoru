class CreateContactHistories < ActiveRecord::Migration
  def change
    create_table :contact_histories do |t|
      t.integer :admin_user_id, null: false
      t.integer :user_id, null: false
      t.string :contact_type
      t.datetime :contact_date_time
      t.text :remarks
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :contact_histories, :admin_user_id
    add_index :contact_histories, :user_id
  end
end
