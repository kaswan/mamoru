class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.integer :study_course_id
      t.string :title
      t.text :summary
      t.integer :image_attachment_id
      t.integer :material_attachment_id
      t.boolean :is_free
      t.integer :price
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
    add_index :tutorials, :study_course_id
  end
end
