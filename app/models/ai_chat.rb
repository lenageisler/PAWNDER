class AiChat < ApplicationRecord
  belongs_to :user
  has_many :ai_messages
  has_one :prefence, through: :user
end
