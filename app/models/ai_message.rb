class AiMessage < ApplicationRecord
  belongs_to :ai_chat

  validates :role, presence: true
  validates :content, length: { minimum: 10, maximum: 1000 }, if: -> { role == "user" }
end
