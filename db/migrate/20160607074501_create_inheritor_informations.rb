class CreateInheritorInformations < ActiveRecord::Migration
  def change
    create_table :inheritor_informations do |t|
      t.integer :user_id, null: false
      t.string :name
      t.string :furigana
      t.date :date_of_birth
      t.string :postalcode
      t.integer :prefecture_id
      t.string :address
      t.string :occupation
      t.string :relationship
      t.text :remarks

      t.timestamps null: false
    end
    
    add_index :inheritor_informations, :user_id
  end
end
