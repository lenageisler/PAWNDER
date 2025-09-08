class Message < ApplicationRecord
  belongs_to :chat
  has_one :favorite, through: :chat
  has_one :searcher_user, through: :chat, source: :searcher
  has_one :shelter_user, through: :chat, source: :shelter

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "chat_#{chat.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, user_role: role}, # Always set as 'sent' for the sender.
                        target: "messages"
    # Although a new message is always set as 'sent', the receiver user will
    # get the message with the proper 'received' style CSS class via Stimulus,
    # thanks to the javascript message_controller, and the data target and value
    # set in the application layout and the message partial.
  end
end
