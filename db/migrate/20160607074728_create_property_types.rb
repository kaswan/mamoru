class CreatePropertyTypes < ActiveRecord::Migration
  def change
    create_table :property_types do |t|
      t.string :name
      t.integer :sort_no
      t.boolean :deleted, deleted: false

      t.timestamps null: false
    end
  end
end
