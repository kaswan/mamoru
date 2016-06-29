class CreateSpecializedFields < ActiveRecord::Migration
  def change
    create_table :specialized_fields do |t|
      t.string :name
      t.integer :sort_no
      t.boolean :deleted, default: false
      
      t.timestamps null: false
    end
  end
end
