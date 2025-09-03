class PreferencesController < ApplicationController

  def show
    if searcher?
      @preference = current_user.preference
    end
  end

  def new
    if searcher?
      @preference = Preference.new
    end
  end

  def create
    if searcher?
      @preference = Preference.new(preference_params)
      @preference.user = current_user
      if @preference.save
        redirect_to preference_path(@preference), notice: "You successfully specified your dog preferences."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    if searcher?
      @preference = Preference.find(params[:id])
    end
  end

  def update
    if searcher?
      @preference = Preference.find(params[:id])
      if @preference.update(preference_params)
        redirect_to preference_path(@preference), notice: "You successfully updated your preferences."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if searcher?
      @preference = Preference.find(params[:id])
      @preference.destroy
      redirect_to root_path, alert: "Your preferences were deleted."
    end
  end

  private

  def preference_params
    params.require(:preference).permit(:age_min, :age_max, :gender, :neutered, :breed_grade, :breed_category, :main_breed, :shoulder_height_min, :shoulder_height_max, :weight_min, :weight_max, :location, :health_issus, :list_dog, :beginner_friendly, :male_compatible, :female_compatible, :cat_compatible, :kids_compatible, :ideal_evironment)
  end

end
