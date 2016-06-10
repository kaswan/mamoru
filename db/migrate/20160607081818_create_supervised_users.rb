class CreateSupervisedUsers < ActiveRecord::Migration
  def change
    create_table :supervised_users do |t|
      t.integer :admin_user_id, null: false
      t.integer :user_id, null: false
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :supervised_users, [:admin_user_id, :user_id], unique: true
  end
end
