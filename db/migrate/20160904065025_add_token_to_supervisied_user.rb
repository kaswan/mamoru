class AddTokenToSupervisiedUser < ActiveRecord::Migration
  def change
    add_column :supervised_users, :token, :string, :after => :id, :unique => true
  end
end
