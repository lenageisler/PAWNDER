class ChatsController < ApplicationController

  def index
    if searcher?
      @searcher_name = current_user.username
      @chats = current_user.searcher_chats
    else
      @shelter_name = current_user.name
      @chats = current_user.shelter_chats
    end
  end

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
