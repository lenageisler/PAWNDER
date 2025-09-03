class ChangeAgeHeightWeightToRangeInPreferences < ActiveRecord::Migration[7.1]
  def change
    # changing existing columns to _min columns
    rename_column :preferences, :age, :age_min
    rename_column :preferences, :shoulder_height, :shoulder_height_min
    rename_column :preferences, :weight, :weight_min

    # adding columns with _max
    add_column :preferences, :age_max, :integer
    add_column :preferences, :shoulder_height_max, :integer
    add_column :preferences, :weight_max, :float
  end
end
