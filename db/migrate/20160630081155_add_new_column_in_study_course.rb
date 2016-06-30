class AddNewColumnInStudyCourse < ActiveRecord::Migration
  def change
    add_column :study_courses, :recommend_for, :text, after: :summary
    add_column :study_courses, :specialized_field_id, :integer, after: :recommend_for
    add_index  :study_courses, :specialized_field_id
    
    remove_column :study_courses, :attachment_id
    remove_column :specialist_profiles, :specialized_field
    
    change_column :attachments, :relation_id, :integer, after: :relation_type
    change_column :attachments, :parent_type, :string, after: :relation_id
    change_column :attachments, :parent_id, :integer, after: :parent_type
  end
end
