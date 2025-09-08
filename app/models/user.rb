class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# Associations for SHELTER users
  has_many :dogs, dependent: :destroy
  has_many :favored_dogs, through: :dogs, source: :favorites
  has_many :chats, through: :favored_dogs, as: :shelter_chats

# Associations for SEARCHER users
  has_one :preference, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_dogs, through: :favorites, source: :dogs
  has_many :ai_chats, dependent: :destroy
  has_many :chats, through: :favorites, as: :searcher_chats

  validates :role, presence: true, inclusion: { in: ["shelter", "searcher"] }

  validates :username, presence: true, if: -> { role == "searcher" }
  validates :name, :shelter_type, :location, presence: true, if: -> { role == "shelter" }
  validates :shelter_type, inclusion: { in: ["Dog Shelter", "International Rescue", "Forster-based Rescue"] }, if: -> { role == "shelter" }
end
