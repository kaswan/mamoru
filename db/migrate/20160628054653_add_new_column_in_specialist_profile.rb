class AddNewColumnInSpecialistProfile < ActiveRecord::Migration
  def change
    add_column :specialist_profiles, :enterprise, :string, :after => :address
  end
end
