class AddImageToSpecialists < ActiveRecord::Migration
  def self.up
    change_table :specialists do |t|
      t.attachment :image, :after => :image_url
    end
  end

  def self.down
    remove_attachment :specialists, :image
  end
end
