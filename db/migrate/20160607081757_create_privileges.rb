class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|
      t.integer :admin_user_id, null: false
      t.boolean :all_user_view, default: false
      t.boolean :user_profile_view, default: false
      t.boolean :user_profile_edit, default: false
      t.boolean :user_inheritor_view, default: false
      t.boolean :user_inheritor_edit, default: false
      t.boolean :user_properry_view, default: false
      t.boolean :user_property_edit, default: false
      t.boolean :user_supervisor_view, default: false
      t.boolean :user_supervisor_edit, default: false
      t.boolean :user_reservation_view, default: false
      t.boolean :user_reservation_edit, default: false
      t.boolean :user_payment_view, default: false
      t.boolean :user_point_view, default: false
      t.boolean :specialist_view, default: false
      t.boolean :specialist_profile_view, default: false
      t.boolean :specialist_profile_edit, default: false
      t.boolean :admin_privilege, default: false

      t.timestamps null: false
    end
    add_index :privileges, :admin_user_id, unique: true
  end
end
