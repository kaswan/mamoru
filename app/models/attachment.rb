class Attachment < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true
  belongs_to :relation, :polymorphic => true
  
  has_attached_file :image, 
                        #preserve_files: "true",
                        styles: {
                          icon:     ["50x50#",  :jpg],
                          square:   ["100x100#",  :jpg], 
                          thumb:    ["150x150#",  :jpg],
                          thumb_m:  ["75x75#",  :jpg],
                          small:    ["180x240>", :jpg],                                                
                          medium:   ["375x500>", :jpg],
                          large:    ["768x1024>", :jpg]},
                        convert_options: {
                          icon:     "-quality 80 -strip",
                          square:   "-quality 80 -strip",
                          thumb:    "-quality 80 -strip",
                          thumb_m:  "-quality 75 -strip",
                          small:    "-quality 80 -strip",                        
                          medium:   "-quality 80 -strip",
                          large:    "-quality 80 -strip",                        
                          original: "-quality 95 -strip" }
      
  has_attached_file :video, styles: {
        :medium => {
          :geometry => "640x480",
          :format => 'mp4'
        },
        :thumb => { :geometry => "276x156", :format => 'jpeg', :time => 10},
        #:medium => { :geometry => "276x156", :format => 'jpeg', :time => 15}
    }, :processors => [:transcoder]
      
  has_attached_file :upload
  
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }    
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
  validates_attachment :upload, content_type: { content_type: "application/pdf" }
    
#  do_not_validate_attachment_file_type :image
  before_save do
    self.parent = self.relation.parent unless self.parent
  end
    
  before_post_process do
    unless video.queued_for_write[:original].nil?
      file = video.queued_for_write[:original].path
      self.video_duration = Paperclip.run("ffprobe", '-i %s -show_entries format=duration -v quiet -of csv="p=0"' % file).to_f
    end
  end
  
  
  
  
end
