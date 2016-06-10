class SupervisedUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin_user
  
  validates_uniqueness_of :admin_user_id, scope: [:admin_user_id, :user_id]  
end
