class AiChat < ApplicationRecord
  belongs_to :user
  has_many :ai_messages, dependent: :destroy
  has_one :prefence, through: :user
end
