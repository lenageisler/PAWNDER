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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :username, :name, :shelter_type, :location])

    # For additional in app/views/devise/registrations/edit.html.erb -> to do?
    # devise_parameter_sanitizer.permit(:account_update, keys: [:role, :username, :name, :type, :location])
  end

  private

  def set_user_preference
    if user_signed_in? && searcher? && current_user.preference.present?
      @preference = current_user.preference
    end
  end
end
