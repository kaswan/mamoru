class CreateScheduleEntities < ActiveRecord::Migration
  def change
    create_table :schedule_entities do |t|
      t.integer :schedule_id, null: false
      t.string :client_type
      t.integer :client_id
      t.string :title
      t.text :remark
      t.date :date
      t.time :start_at
      t.time :end_at
      t.boolean :editable, default: true
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
