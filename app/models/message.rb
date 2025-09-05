class Message < ApplicationRecord
  belongs_to :chat
  has_one :favorite, through: :chat

  after_create_commit :broadcast_message

  private

  def broadcast_message
    role = chat.user.role # This is a bug! the rol user_sole is always the same no matter who writes the message
    broadcast_append_to "chat_#{chat.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, favorite: self.chat.favorite, user_role: role}, # bug in user_role
                        target: "messages"
  end
end
