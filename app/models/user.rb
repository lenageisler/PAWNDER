class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# Associations for SHELTER users
  has_many :dogs
  has_many :favorites, through: :dogs, as: :favored_dogs
  has_many :chats, through: :favored_dogs, as: :shelter_chats

# Associations for SEARCHER users  
  has_one :preference
  has_many :favorites
  has_many :dogs, through: :favorites, as: :favorite_dogs
  has_many :ai_chats
  has_many :chats, through: :favorites, as: :searcher_chats

  validates :role, presence: true, inclusion: { in: ["shelter", "searcher"] }

  validates :username, presence: true, if: -> { role == "searcher" }
  validates :name, :shelter_type, :location, presence: true, if: -> { role == "shelter" }
  validates :shelter_type, inclusion: { in: ["Dog Shelter", "International Rescue", "Forster-based Rescue"] }, if: -> { role == "shelter" }
end
