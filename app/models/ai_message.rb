class AiMessage < ApplicationRecord
  acts_as_message

  belongs_to :ai_chat
  has_one :user, through: :ai_chat

  validates :role, presence: true
  validates :ai_chat, presence: true
  validates :content, length: { minimum: 10, maximum: 1000 }, if: -> { role == "user" }
end
