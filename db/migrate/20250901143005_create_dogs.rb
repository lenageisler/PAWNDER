class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.date :birthday
      t.integer :age
      t.string :gender
      t.boolean :neutered
      t.string :breed_grade
      t.string :breed_category
      t.string :main_breed
      t.text :breed_mix
      t.integer :shoulder_height
      t.float :weight
      t.date :in_shelter_since
      t.string :location
      t.boolean :chipped
      t.boolean :health_issus
      t.text :health_issus_details
      t.boolean :list_dog
      t.boolean :beginner_friendly
      t.string :male_compatible
      t.string :female_compatible
      t.string :cat_compatible
      t.string :kids_compatible
      t.string :ideal_evironment
      t.text :info

      t.timestamps
    end
  end
end
