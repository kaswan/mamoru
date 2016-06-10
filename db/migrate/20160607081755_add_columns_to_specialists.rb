class AddColumnsToSpecialists < ActiveRecord::Migration
  def change
    add_column :specialists, :name, :string, :after => :email
    add_column :specialists, :gender, :string, :after => :name
    add_column :specialists, :image_url, :string, :after => :gender
    add_column :specialists, :location, :string, :after => :image_url
    add_column :specialists, :url, :string, :after => :location
    add_column :specialists, :uid, :string, :after => :url
    add_column :specialists, :provider, :string, :after => :uid
  end
end
