class Schedule < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  has_many :schedule_entities, dependent: :destroy  
  
  accepts_nested_attributes_for :schedule_entities, allow_destroy: true
end
