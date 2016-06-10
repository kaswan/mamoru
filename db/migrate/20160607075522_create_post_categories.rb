class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :name
      t.integer :sort_no
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
