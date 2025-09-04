class RenameIdealEvironmentToIdealEnvironmentInDogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :dogs, :ideal_evironment, :ideal_environment
  end
end
