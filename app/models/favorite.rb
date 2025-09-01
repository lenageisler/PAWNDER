class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  has_one :chat
  has_many :messages, through: :chat
end
