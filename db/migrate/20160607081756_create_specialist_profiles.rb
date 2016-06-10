class CreateSpecialistProfiles < ActiveRecord::Migration
  def change
    create_table :specialist_profiles do |t|
      t.integer :specialist_id, null: false
      t.string :name
      t.string :furigana
      t.date :date_of_birth
      t.string :postalcode
      t.integer :prefecture_id
      t.string :address
      t.string :qualification
      t.string :specialized_field
      t.text :introduction
      t.string :home_page_url
      t.text :remarks

      t.timestamps null: false
    end
    add_index :specialist_profiles, :specialist_id, unique: true
  end
end
