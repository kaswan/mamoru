class CreatePropertyInformations < ActiveRecord::Migration
  def change
    create_table :property_informations do |t|
      t.integer :user_id, null: false
      t.string :type
      t.integer :property_type_id
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :property_informations, :user_id
    add_index :property_informations, :property_type_id
  end
end
