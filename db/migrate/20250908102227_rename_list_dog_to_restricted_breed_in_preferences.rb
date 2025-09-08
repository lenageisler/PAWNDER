class RenameListDogToRestrictedBreedInPreferences < ActiveRecord::Migration[7.1]
  def change
    rename_column :preferences, :list_dog, :restricted_breed
  end
end
