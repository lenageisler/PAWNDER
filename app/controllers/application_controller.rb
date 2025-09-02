class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :shelter?, :searcher?
  
  def shelter?
    current_user&.role == "shelter"
  end

  def searcher?
    current_user&.role == "searcher"
  end
end
