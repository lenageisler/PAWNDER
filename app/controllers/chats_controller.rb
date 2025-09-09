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
    if searcher?
      favorite = Favorite.find(params[:favorite_id])
      if favorite.chat.present?
        redirect_to chat_path(favorite.chat)
      else
        @chat = Chat.new
        @chat.favorite = favorite
        if @chat.save
          redirect_to chat_path(@chat)
        else
          @favorites = current_user.favorites
          render "favorites/index", status: :unprocessable_entity
        end
      end
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

end
