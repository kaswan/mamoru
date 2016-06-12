class StudyCourse < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  has_one :attachment, as: :relation, dependent: :destroy
  has_many :tutorials, dependent: :destroy
  
  accepts_nested_attributes_for :tutorials, allow_destroy: true
  accepts_nested_attributes_for :attachment, allow_destroy: true
end
