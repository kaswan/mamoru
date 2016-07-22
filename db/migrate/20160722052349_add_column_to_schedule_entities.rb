class AddColumnToScheduleEntities < ActiveRecord::Migration
  def change
    add_column :schedule_entities, :conversation_id, :integer, :after => :client_id
  end
end
