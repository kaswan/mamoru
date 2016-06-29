class CreateSpecializedFieldRelations < ActiveRecord::Migration
  def change
    create_table :specialized_field_relations do |t|
      t.integer :specialized_field_id, null: false
      t.integer :specialist_id, null: false
      
      t.timestamps null: false
    end
    
    add_index :specialized_field_relations, :specialized_field_id
    add_index :specialized_field_relations, :specialist_id
  end
end
