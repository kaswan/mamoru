class AddImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image, :after => :image_url
    end
  end

  def self.down
    remove_attachment :users, :image
  end
end
