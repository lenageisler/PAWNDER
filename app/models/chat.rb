class Chat < ApplicationRecord
  belongs_to :favorite
  has_many :messages, dependent: :destroy
  has_one :dog, through: :favorite
  has_one :shelter, through: :dog, source: :user # The shelter user (through Dog.user_id)
  has_one :searcher, through: :favorite, source: :user # The searcher user (directly from Favorite.user_id)
end
