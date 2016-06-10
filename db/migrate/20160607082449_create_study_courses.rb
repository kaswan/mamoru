class CreateStudyCourses < ActiveRecord::Migration
  def change
    create_table :study_courses do |t|
      t.string :parent_type, null: false
      t.integer :parent_id, null: false
      t.string :name
      t.text :summary
      t.integer :attachment_id
      t.integer :payment_type_id
      t.boolean :is_free
      t.integer :price
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :study_courses, :parent_id
  end
end
