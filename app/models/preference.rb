class Preference < ApplicationRecord
  belongs_to :user

  validates :age, numericality: { only_integer: true }, allow_blank: true
  validates :gender, inclusion: { in: ["male", "female"] }, allow_blank: true
  validates :breed_grade, inclusion: { in: ["Pure breed", "Hybrid", "Mix"] }, allow_blank: true
  validates :breed_category, inclusion: { in: [ "Shepherd-type", "Herding-type", "Retriever-type", "Poudle-type", "Big gentle", "Sporty-Hunting-type", "Hound-type", "Spitz-type", "Compact & sturdy", "Terrier-type", "Small & fluffy", "Small & slick", "Sausage-type", "Medium mixed", "Large mixed", "Small mixed"] }, allow_blank: true
  validates :shoulder_height, numericality: { only_integer: true }, allow_blank: true
  validates :weight, numericality: true, allow_blank: true
  validates :location, inclusion: { in: ["Shelter", "Foster Care", "Overseas"] }, allow_blank: true
  validates :male_compatible, inclusion: { in: ["yes"] }, allow_blank: true
  validates :female_compatible, inclusion: { in: ["yes"] }, allow_blank: true
  validates :cat_compatible, inclusion: { in: ["yes"] }, allow_blank: true
  validates :kids_compatible, inclusion: { in: ["yes"] }, allow_blank: true
  validates :ideal_evironment, inclusion: { in: ["Apartment-friendly", "House with garden", "Countryside", "City life", "Quiet environment"] }, allow_blank: true

end
