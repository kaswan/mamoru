class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_attached_file :image, 
                      preserve_files: "true",
                      styles: {
                        icon:     ["50x50#",  :jpg],
                        square:   ["100x100#",  :jpg], 
                        thumb:    ["150x150#",  :jpg],
                        thumb_m:  ["75x75#",  :jpg],
                        small:    ["180x240>", :jpg],                                                
                        midium:   ["375x500>", :jpg],
                        large:    ["768x1024>", :jpg]},
                      convert_options: {
                        icon:     "-quality 80 -strip",
                        square:   "-quality 80 -strip",
                        thumb:    "-quality 80 -strip",
                        thumb_m:  "-quality 75 -strip",
                        small:    "-quality 80 -strip",                        
                        midium:   "-quality 80 -strip",
                        large:    "-quality 80 -strip",                        
                        original: "-quality 95 -strip" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
      
  
  has_one  :user_profile, dependent: :destroy, autosave: true
  has_one  :profile, class_name: 'UserProfile'
  has_many :inheritor_informations, dependent: :destroy
  has_many :property_informations, dependent: :destroy
  has_many :payment_informations, dependent: :destroy
  has_many :supervised_users, dependent: :destroy
  has_many :attachments, as: :parent, dependent: :destroy
  has_many :posts, as: :parent, dependent: :destroy
  has_one  :pending_post, -> { where pending_status: true }, as: :parent, class_name: 'Post' 
  has_many :schedules, as: :parent, dependent: :destroy
  has_many :schedule_entities, through: :schedules
  has_many :reservations, class_name: 'ScheduleEntity', as: :client
  
  has_many :send_requests, class_name: 'Conversation', as: :sender
  has_many :get_requests, class_name: 'Conversation', as: :recipient
  
  accepts_nested_attributes_for :user_profile
  accepts_nested_attributes_for :inheritor_informations, allow_destroy: true
  accepts_nested_attributes_for :property_informations, allow_destroy: true
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :supervised_users, allow_destroy: true
  
  before_save do
    self.name = self.email.split('@').first if self.name.nil?
    self.name = self.user_profile.name if self.user_profile && self.user_profile.name 
  end
  
  def self.find_for_oauth(auth_hash)    
    user = find_or_create_by(email: auth_hash.info.email)
    user.email = auth_hash.info.email
    user.name = auth_hash.info.name ? auth_hash.info.name : auth_hash.info.email.split('@').first 
    user.gender = auth_hash.extra.raw_info.gender unless auth_hash.extra.raw_info.gender.blank?
    user.location = auth_hash.info.location if auth_hash.provider == 'facebook'
    user.image_url = auth_hash.info.image unless auth_hash.provider == 'yahoojp'
    user.url = auth_hash.info.urls[auth_hash.provider.capitalize] unless auth_hash.provider == 'yahoojp'          
    user.password = 'broz1101' if user.password.nil?  
    
    user.uid = auth_hash.uid
    user.provider = auth_hash.provider
    user.save!
    user
  end
       
end
