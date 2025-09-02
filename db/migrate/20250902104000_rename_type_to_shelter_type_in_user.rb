class RenameTypeToShelterTypeInUser < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :type, :shelter_type
  end
end
