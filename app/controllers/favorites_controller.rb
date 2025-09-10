class FavoritesController < ApplicationController
  def create
    if searcher?
      @dog = Dog.find(params[:dog_id])
      @favorite = Favorite.new()
      @favorite.dog = @dog
      @favorite.user = current_user
      if @favorite.save
        redirect_to dog_path(@dog), notice: "You have successfully added #{@dog.name} to your favorites."
      else
        render "dogs/show", status: :unprocessable_entity
      end
    end
  end

  def index
    if searcher?
      @favorites = Favorite.where(user_id: current_user)
    end

  end

  def destroy
    if searcher?
      @dog = Dog.find(params[:dog_id])
      @favorite = @dog.favorites.find_by(user: current_user)
      if @favorite
        @favorite.destroy
        redirect_to dog_path(@dog), alert: "#{@favorite.dog.name} was deleted from your favorites."
      else
        redirect_to dog_path(@dog), alert: "Favorite not found."
      end
    end
  end
end
