class AiChat < ApplicationRecord
  acts_as_chat

  belongs_to :user
  has_many :ai_messages, dependent: :destroy
  has_one :prefence, through: :user
end
