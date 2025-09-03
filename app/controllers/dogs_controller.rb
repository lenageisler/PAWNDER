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
    pref = current_user.preference

    @dogs = @dogs.where("age >= ?", pref.age_min) if pref.age_min.present?
    @dogs = @dogs.where("age <= ?", pref.age_max) if pref.age_max.present?
    @dogs = @dogs.where(gender: pref.gender) if pref.gender.present?
    @dogs = @dogs.where(neutered: pref.neutered) if pref.neutered.present?
    # breed grade multi
    # breed cat multi
    @dogs = @dogs.where("main_breed ILIKE ?", "%#{pref.main_breed}%") if pref.main_breed.present? #difficult to match - disclaimer in form??
    @dogs = @dogs.where("shoulder_height >= ?", pref.shoulder_height_min) if pref.shoulder_height_min.present?
    @dogs = @dogs.where("shoulder_height <= ?", pref.shoulder_height_max) if pref.shoulder_height_max.present?
    @dogs = @dogs.where("weight >= ?", pref.weight_min) if pref.weight_min.present?
    @dogs = @dogs.where("weight <= ?", pref.weight_max) if pref.weight_max.present?
    # location multi
    @dogs = @dogs.where(health_issus: pref.health_issus) if pref.health_issus.present?
    @dogs = @dogs.where(list_dog: pref.list_dog) if pref.list_dog.present?
    @dogs = @dogs.where(beginner_friendly: pref.beginner_friendly) if pref.beginner_friendly.present?
    @dogs = @dogs.where(male_compatible: pref.male_compatible) if pref.male_compatible.present?
    @dogs = @dogs.where(female_compatible: pref.female_compatible) if pref.female_compatible.present?
    @dogs = @dogs.where(cat_compatible: pref.cat_compatible) if pref.cat_compatible.present?
    @dogs = @dogs.where(kids_compatible: pref.kids_compatible) if pref.kids_compatible.present?
    # environment multi
  end

end
