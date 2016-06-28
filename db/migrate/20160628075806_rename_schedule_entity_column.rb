class RenameScheduleEntityColumn < ActiveRecord::Migration
  def change
    rename_column :schedule_entities, :date, :schedule_date
  end
end
