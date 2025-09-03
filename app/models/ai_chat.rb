class AiChat < ApplicationRecord
  acts_as_chat message_class: "AiMessage"
  # message_class: sets Model with a name different from default one (Message)

  belongs_to :user
  has_many :ai_messages, dependent: :destroy
  has_one :preference, through: :user
end
