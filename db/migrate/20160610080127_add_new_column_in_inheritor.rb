class AddNewColumnInInheritor < ActiveRecord::Migration
  def change
    add_column :inheritor_informations, :gender, :string, :after => :furigana
  end
end
