class Schedule < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  has_many :schedule_entities, dependent: :destroy  
end
