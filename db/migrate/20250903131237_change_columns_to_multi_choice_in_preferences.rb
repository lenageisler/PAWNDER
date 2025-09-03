class ChangeColumnsToMultiChoiceInPreferences < ActiveRecord::Migration[7.1]
  def change
    change_column :preferences, :breed_grade, :string, array: true, default: [], using: 'ARRAY[breed_grade]'
    change_column :preferences, :breed_category, :string, array: true, default: [], using: 'ARRAY[breed_category]'
    change_column :preferences, :location, :string, array: true, default: [], using: 'ARRAY[location]'
    change_column :preferences, :ideal_evironment, :string, array: true, default: [], using: 'ARRAY[ideal_evironment]'
  end
end
