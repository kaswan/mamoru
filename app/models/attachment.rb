class Attachment < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  belongs_to :relation, :polymorphic => true
  
  has_attached_file :upload, 
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
  validates_attachment :upload, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
#  do_not_validate_attachment_file_type :image
    before_save do
      self.parent = self.relation.parent
    end
end
