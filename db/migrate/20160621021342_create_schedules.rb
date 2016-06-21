class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :type
      t.string :parent_type, null: false
      t.integer :parent_id, null: false
      t.string :title
      t.string :public_title
      t.text :remark
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
