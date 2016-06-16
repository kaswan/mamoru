class SpecialistProfile < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :prefecture
end
