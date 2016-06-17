class AddAttachmentImageVideoToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :video, :after => :relation_type
      t.attachment :image, :after => :relation_type      
    end
  end

  def self.down
    remove_attachment :attachments, :video
    remove_attachment :attachments, :image
  end
end
