class AddContactFieldToProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :contact_info, :string, :after => :address
    add_column :specialist_profiles, :tel, :string, :after => :address
    add_column :specialist_profiles, :fax, :string, :after => :address
  end
end
