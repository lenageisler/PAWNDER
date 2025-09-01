class CreatePreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :preferences do |t|
      t.integer :age
      t.string :gender
      t.boolean :neutered
      t.string :breed_grade
      t.string :breed_category
      t.string :main_breed
      t.integer :shoulder_height
      t.float :weight
      t.string :location
      t.boolean :health_issus
      t.boolean :list_dog
      t.boolean :beginner_friendly
      t.string :male_compatible
      t.string :female_compatible
      t.string :cat_compatible
      t.string :kids_compatible
      t.string :ideal_evironment

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
