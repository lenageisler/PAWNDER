class Chat < ApplicationRecord
  belongs_to :favorite
  has_many :messages
  has_one :dog, through: :favorite
  has_one :user, through: :favorite
end
