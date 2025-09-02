class AiMessagesController < ApplicationController

  def new
    @ai_chat = AiChat.find(params[:ai_chat_id])
    @ai_message = AiMessage.new
  end
  
end
