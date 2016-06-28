class ScheduleEntity < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :client, :polymorphic => true
  
  before_save do
    self.schedule_date = self.schedule.start_date 
  end
end
