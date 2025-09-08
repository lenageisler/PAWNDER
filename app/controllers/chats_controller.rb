class ChatsController < ApplicationController

  def create
    @chat = Chat.new
    @chat.favorite = Favorite.find(params[:favorite_id])
    if @chat.save
      redirect_to chat_path(@chat)
    else
      render "favorites/index"
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

end
