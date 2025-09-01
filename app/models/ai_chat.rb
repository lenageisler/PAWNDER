class AiChat < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one :prefence, through: :user
end
