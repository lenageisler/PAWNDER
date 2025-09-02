class Chat < ApplicationRecord
  belongs_to :favorite
  has_many :messages
  has_one :dog, through: :favorite, as: :chat_dog
  has_one :user, through: :chat_dog, as: :shelter_user
  has_one :user, through: :favorite, as: :searcher_user
end
