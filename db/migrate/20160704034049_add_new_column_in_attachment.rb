class AddNewColumnInAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :video_duration, :string, after: :video_file_name    
  end
end
