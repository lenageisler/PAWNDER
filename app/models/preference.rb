class Preference < ApplicationRecord
  belongs_to :user

  validates :age, numericality: { only_integer: true }
  validates :gender, inclusion: { in: ["male", "female"] }
  validates :breed_grade, inclusion: { in: ["Pure breed", "Hybrid", "Mix"] }
  validates :breed_category
  validates :shoulder_height, numericality: { only_integer: true }
  validates :weight, numericality: true
  validates :location, inclusion: { in: ["Shelter", "Foster Care", "Overseas"] }
  validates :male_compatible, inclusion: { in: ["yes", "no"] }
  validates :female_compatible, inclusion: { in: ["yes", "no"] }
  validates :cat_compatible, inclusion: { in: ["yes", "no"] }
  validates :kids_compatible, inclusion: { in: ["yes", "no"] }
end
