class RenameListDogToRestrictedBreedInDogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :dogs, :list_dog, :restricted_breed
  end
end
