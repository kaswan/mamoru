class ScheduleEntity < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :client, :polymorphic => true
end
