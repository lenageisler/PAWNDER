class AiChatsController < ApplicationController

  def create
    @ai_chat = AiChat.new
    @ai_chat.user = current_user
    if @ai_chat.save
      redirect_to ai_chat_path(@ai_chat)
    else
      render "pages/home" # For now, in the future should stay in the current view
    end
  end
  
  def show
    @ai_chat = AiChat.find(params[:id])
    @ai_message = AiMessage.new
    @ai_messages = AiMessage.all
  end
end
