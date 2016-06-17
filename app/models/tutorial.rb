class Tutorial < ActiveRecord::Base
  belongs_to :study_course, touch: true
  has_one :attachment, as: :relation, dependent: :destroy
  
  accepts_nested_attributes_for :attachment, allow_destroy: true
end
