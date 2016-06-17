class Post < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  belongs_to :post_type
  has_many :attachments, as: :relation, dependent: :destroy, counter_cache: true
  
  default_scope  { order(:created_at => :desc) }
  scope :active, -> { where(:pending_status => false)}
    
    
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
