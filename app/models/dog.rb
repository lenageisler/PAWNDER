class Dog < ApplicationRecord
  # SHELTER user
  belongs_to :user

  # SEARCHER user
  has_many :dog_searchers, through: :favorites, source: :user

  has_many :favorites, dependent: :destroy
  has_many :chats, through: :favorites, as: :dog_chats

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :gender, presence: true, inclusion: { in: ["male", "female"] }
  validates :breed_grade, presence: true, inclusion: { in: ["Pure breed", "Hybrid", "Mix"] }
  validates :breed_category, presence: true, inclusion: { in: [ "Shepherd-type", "Herding-type", "Retriever-type", "Poudle-type", "Big gentle", "Sporty-Hunting-type", "Hound-type", "Spitz-type", "Compact & sturdy", "Terrier-type", "Small & fluffy", "Small & slick", "Sausage-type", "Medium mixed", "Large mixed", "Small mixed"] }
  validates :shoulder_height, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: true
  validates :location, presence: true, inclusion: { in: ["Shelter", "Foster Care", "Overseas"] }
  validates :male_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :female_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :cat_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :kids_compatible, presence: true, inclusion: { in: ["yes", "no", "unknown"] }
  validates :ideal_environment, presence: true, inclusion: { in: ["Apartment-friendly", "House with garden", "Countryside", "City life", "Quiet environment"] }

end
