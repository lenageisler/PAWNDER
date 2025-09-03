class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if searcher?
      @preference = current_user.preference
    end
  end
end
