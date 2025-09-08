class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  has_one :shelter_user, through: :dog, source: :user
  has_one :chat, dependent: :destroy
  has_many :messages, through: :chat

  validates :user_id, uniqueness: { scope: :dog_id }
end
