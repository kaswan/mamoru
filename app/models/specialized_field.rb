class SpecializedField < ActiveRecord::Base
  has_many :specialized_field_relations, dependent: :destroy
  has_many :specialists, through: :specialized_field_relations
  has_many :study_courses
end
