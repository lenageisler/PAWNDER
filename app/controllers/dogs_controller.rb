class DogsController < ApplicationController
  def index
    if shelter?
      @shelter_name = current_user.name
      @dogs = current_user.dogs
      raise
    end
  end

end
