class RenameScheduleField < ActiveRecord::Migration
  def change
    rename_column :schedules, :type, :schedule_type
    rename_column :schedule_entities, :start_at, :start_time
    rename_column :schedule_entities, :end_at, :end_time
  end
end
