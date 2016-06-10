class CreatePaymentInformations < ActiveRecord::Migration
  def change
    create_table :payment_informations do |t|
      t.integer :user_id, null: false
      t.integer :payment_type_id
      t.integer :course_id
      t.integer :amount
      t.datetime :payment_date_time
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :payment_informations, :user_id
    add_index :payment_informations, :payment_type_id
    add_index :payment_informations, :course_id
  end
end
