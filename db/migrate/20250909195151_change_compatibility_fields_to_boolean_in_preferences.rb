class ChangeCompatibilityFieldsToBooleanInPreferences < ActiveRecord::Migration[7.1]
  def change
    change_column :preferences, :male_compatible, :boolean, using: "male_compatible = 'yes'"
    change_column :preferences, :female_compatible, :boolean, using: "female_compatible = 'yes'"
    change_column :preferences, :cat_compatible, :boolean, using: "cat_compatible = 'yes'"
    change_column :preferences, :kids_compatible, :boolean, using: "kids_compatible = 'yes'"
  end
end
