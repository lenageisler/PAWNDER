class AiChatsController < ApplicationController

  def show
    @ai_chat = AiChat.find(params[:id])
    @ai_message = AiMessage.new
    @ai_messages = AiMessage.all
  end
end
