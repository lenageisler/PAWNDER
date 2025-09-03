class Preference < ApplicationRecord
  belongs_to :user

  #ranges
  validates :age_min, numericality: { only_integer: true }, allow_blank: true
  validates :age_max, numericality: { only_integer: true }, allow_blank: true
  validates :shoulder_height_min, numericality: { only_integer: true }, allow_blank: true
  validates :shoulder_height_max, numericality: { only_integer: true }, allow_blank: true
  validates :weight_min, numericality: true, allow_blank: true
  validates :weight_max, numericality: true, allow_blank: true

  #multiple choice
  # validates :breed_grade, inclusion: { in: ["Pure breed", "Hybrid", "Mix"] }, allow_blank: true
  # validates :breed_category, inclusion: { in: [ "Shepherd-type", "Herding-type", "Retriever-type", "Poudle-type", "Big gentle", "Sporty-Hunting-type", "Hound-type", "Spitz-type", "Compact & sturdy", "Terrier-type", "Small & fluffy", "Small & slick", "Sausage-type", "Medium mixed", "Large mixed", "Small mixed"] }, allow_blank: true
  # validates :location, inclusion: { in: ["Shelter", "Foster Care", "Overseas"] }, allow_blank: true
  # validates :ideal_environment, inclusion: { in: ["Apartment-friendly", "House with garden", "Countryside", "City life", "Quiet environment"] }, allow_blank: true
  validate :breed_grade_validation
  validate :breed_category_validation
  validate :location_validation
  validate :ideal_environment_validation

  def breed_grade_validation
    breed_grade.any? do |value|
      ["Pure breed", "Hybrid", "Mix"].include?(value)
    end
  end

  def breed_category_validation
    breed_category.any? do |value|
      [ "Shepherd-type", "Herding-type", "Retriever-type", "Poudle-type", "Big gentle",
        "Sporty-Hunting-type", "Hound-type", "Spitz-type", "Compact & sturdy", "Terrier-type",
        "Small & fluffy", "Small & slick", "Sausage-type", "Medium mixed", "Large mixed", "Small mixed"].include?(value)
    end
  end

  def location_validation
    location.any? do |value|
      ["Shelter", "Foster Care", "Overseas"].include?(value)
    end
  end

  def ideal_environment_validation
    ideal_environment.any? do |value|
      ["Apartment-friendly", "House with garden", "Countryside", "City life", "Quiet environment"].include?(value)
    end
  end

  #others
  validates :gender, inclusion: { in: ["male", "female"] }, allow_blank: true
  validates :male_compatible, inclusion: { in: ["yes"] }, allow_blank: true
  validates :female_compatible, inclusion: { in: ["yes"] }, allow_blank: true
  validates :cat_compatible, inclusion: { in: ["yes"] }, allow_blank: true
  validates :kids_compatible, inclusion: { in: ["yes"] }, allow_blank: true

end
