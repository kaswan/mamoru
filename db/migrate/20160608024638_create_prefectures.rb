class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :name
      t.string :yomigana
      t.integer :sort_no

      t.timestamps null: false
    end
  end
end
