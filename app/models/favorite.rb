class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  has_one :shelter_user, through: :dog, source: :user
  has_one :chat
  has_many :messages, through: :chat

  validates :dog_id, uniqueness: { scope: :user_id }
end
