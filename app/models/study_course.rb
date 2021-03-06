class StudyCourse < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  belongs_to :specialized_field
  has_one :attachment, as: :relation, dependent: :destroy
  has_many :tutorials, dependent: :destroy, counter_cache: true
  
  accepts_nested_attributes_for :tutorials, allow_destroy: true
  accepts_nested_attributes_for :attachment, allow_destroy: true
end
