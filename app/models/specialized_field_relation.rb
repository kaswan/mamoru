class SpecializedFieldRelation < ActiveRecord::Base
  belongs_to :specialized_field
  belongs_to :specialist
  
  validates :specialized_field_id, presence: true
end
