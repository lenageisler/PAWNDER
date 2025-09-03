class DogsController < ApplicationController
  def index
    if shelter?
      @shelter_name = current_user.name
      @dogs = current_user.dogs
    elsif searcher?
      @dogs = Dog.all
      preference_filter if current_user.preference.present?
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    if shelter?
      @dog = Dog.new
    end
  end

  def create
    if shelter?
      @dog = Dog.new(dog_params)
      @dog.user = current_user
      if @dog.save
        redirect_to dog_path(@dog), notice: "You successfully added your dog."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    if shelter?
      @dog = Dog.find(params[:id])
    end
  end

  def update
    if shelter?
      @dog = Dog.find(params[:id])
      if @dog.update(dog_params)
        redirect_to dog_path(@dog), notice: "You successfully updated your dog."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if shelter?
      @dog = Dog.find(params[:id])
      @dog.destroy
      redirect_to dogs_path, alert: "Your dog was deleted.", status: :see_other
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :birthday, :age, :gender, :neutered, :breed_grade, :breed_category, :main_breed, :breed_mix, :shoulder_height, :weight, :in_shelter_since, :location, :chipped, :health_issus, :health_issus_details, :list_dog, :beginner_friendly, :male_compatible, :female_compatible, :cat_compatible, :kids_compatible, :ideal_evironment, :info)
  end

  def preference_filter

  end

end
