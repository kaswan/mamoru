class AddImageToAdminUsers < ActiveRecord::Migration
  def self.up
    change_table :admin_users do |t|
      t.attachment :image, :after => :image_url
    end
  end

  def self.down
    remove_attachment :admin_users, :image
  end
end
