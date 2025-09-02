class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :username, :name, :type, :location])

    # For additional in app/views/devise/registrations/edit.html.erb -> to do?
    # devise_parameter_sanitizer.permit(:account_update, keys: [:role, :username, :name, :type, :location])
  end
end
