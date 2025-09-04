class RenameIdealEvironmentToIdealEnvironmentInPreferences < ActiveRecord::Migration[7.1]
  def change
    rename_column :preferences, :ideal_evironment, :ideal_environment
  end
end
