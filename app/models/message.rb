class Message < ApplicationRecord
  belongs_to :chat

  has_one :favorite, through: :chat
end
