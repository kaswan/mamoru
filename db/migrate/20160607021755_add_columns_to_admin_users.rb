class AddColumnsToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :name, :string, :after => :email
    add_column :admin_users, :gender, :string, :after => :name
    add_column :admin_users, :image_url, :string, :after => :gender
    add_column :admin_users, :location, :string, :after => :image_url
    add_column :admin_users, :url, :string, :after => :location
    add_column :admin_users, :uid, :string, :after => :url
    add_column :admin_users, :provider, :string, :after => :uid
  end
end
