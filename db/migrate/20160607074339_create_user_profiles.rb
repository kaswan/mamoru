class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id, null: false
      t.string :name
      t.string :furigana
      t.date :date_of_birth
      t.string :postalcode
      t.integer :prefecture_id
      t.string :address
      t.string :occupation
      t.string :interest
      t.text :remarks

      t.timestamps null: false
    end
    add_index :user_profiles, :user_id, unique: true    
  end
end
