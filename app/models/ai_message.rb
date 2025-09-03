class AiMessage < ApplicationRecord
  acts_as_message chat_class: "AiChat", chat_foreign_key: "ai_chat_id"
  # chat_class: & chat_foreign_key: sets the Chat with a different name than the default one (Chat)

  belongs_to :ai_chat
  has_one :user, through: :ai_chat

  validates :role, presence: true
  # validates :ai_chat, presence: true # Arby told me this is not required
  validates :content, length: { minimum: 10, maximum: 1000 }, if: -> { role == "user" }
end
