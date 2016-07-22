class ScheduleEntity < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :client, :polymorphic => true
  belongs_to :conversation
  
  before_save do
    self.schedule_date = self.schedule.start_date 
  end
end
