class UserProfile < ActiveRecord::Base
  belongs_to :user
  belongs_to :prefecture
  has_many :inheritor_inforamtions, :through => :user
end
