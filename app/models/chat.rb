class Chat < ApplicationRecord
  belongs_to :favorite

  has_many :messages
end
