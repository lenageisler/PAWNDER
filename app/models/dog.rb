class Dog < ApplicationRecord
  belongs_to :user
  has_many :favorites

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :gender, presence: true, inclusion: { in: ["male", "female"] }
  validates :breed_grade, presence: true, inclusion: { in: ["Pure breed", "Hybrid", "Mix"] }
  validates :breed_category
  validates :shoulder_height, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: true
  validates :location, presence: true, inclusion: { in: ["Shelter", "Foster Care", "Overseas"] }
  validates :male_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :female_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :cat_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :kids_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :ideal_evironment, presence: true

end
