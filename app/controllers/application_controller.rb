class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_user_preference
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :shelter?, :searcher?

  def shelter?
    current_user&.role == "shelter"
  end

  def searcher?
    current_user&.role == "searcher"
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :username, :name, :shelter_type, :location, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb -> to do?
    # devise_parameter_sanitizer.permit(:account_update, keys: [:role, :username, :name, :type, :location])
  end

  def after_sign_in_path_for(_resource)
    if shelter?
      dogs_path
    elsif searcher?
      dogs_path
    else
      dogs_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    dogs_path
  end

  private

  def set_user_preference
    if user_signed_in? && searcher? && current_user.preference.present?
      @preference = current_user.preference
    end
  end
end
