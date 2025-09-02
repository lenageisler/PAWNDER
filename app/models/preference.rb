class Preference < ApplicationRecord
  belongs_to :user

  validates :age, numericality: { only_integer: true }, allow_nil: true
  validates :gender, inclusion: { in: ["male", "female"] }, allow_nil: true
  validates :breed_grade, inclusion: { in: ["Pure breed", "Hybrid", "Mix"] }, allow_nil: true
  validates :breed_category, inclusion: { in: [ "Shepherd-type", "Herding-type", "Retriever-type", "Poudle-type", "Big gentle", "Sporty-Hunting-type", "Hound-type", "Spitz-type", "Compact & sturdy", "Terrier-type", "Small & fluffy", "Small & slick", "Sausage-type", "Medium mixed", "Large mixed", "Small mixed"] }, allow_nil: true
  validates :shoulder_height, numericality: { only_integer: true }, allow_nil: true
  validates :weight, numericality: true, allow_nil: true
  validates :location, inclusion: { in: ["Shelter", "Foster Care", "Overseas"] }, allow_nil: true
  validates :male_compatible, inclusion: { in: ["yes", "no"] }, allow_nil: true
  validates :female_compatible, inclusion: { in: ["yes", "no"] }, allow_nil: true
  validates :cat_compatible, inclusion: { in: ["yes", "no"] }, allow_nil: true
  validates :kids_compatible, inclusion: { in: ["yes", "no"] }, allow_nil: true
  validates :ideal_evironment, inclusion: { in: ["Apartment-friendly", "House with garden", "Countryside", "City life", "Quiet environment"] }, allow_nil: true

end
