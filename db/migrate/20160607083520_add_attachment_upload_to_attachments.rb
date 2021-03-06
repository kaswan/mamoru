class AddAttachmentUploadToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :upload, :before => :relation_type
    end
  end

  def self.down
    remove_attachment :attachments, :upload
  end
end
