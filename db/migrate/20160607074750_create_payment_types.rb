class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :name
      t.integer :sort_no
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
