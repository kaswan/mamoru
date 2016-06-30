class Specialist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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
      
  has_one :specialist_profile, autosave: true
  has_one :profile, class_name: 'SpecialistProfile'
  has_many :study_courses, as: :parent
  has_many :attachments, as: :parent, dependent: :destroy
  has_many :posts, as: :parent, dependent: :destroy
  has_one  :pending_post, -> { where pending_status: true }, as: :parent, class_name: 'Post' 
  has_many :schedules, as: :parent, dependent: :destroy
  has_many :schedule_entities, through: :schedules
  has_many :reservations, class_name: 'ScheduleEntity', as: :client
  has_many :specialized_field_relations, dependent: :destroy
  
  accepts_nested_attributes_for :specialist_profile
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :specialized_field_relations, allow_destroy: true
  
  before_save do
    self.name = self.email.split('@').first if self.name.nil?
    self.name = self.specialist_profile.name if self.specialist_profile && self.specialist_profile.name
    self.email = email.downcase
  end
  
  
end
