class HomeController < ApplicationController
  def index
    @positions = Position.all
    @pagy, @positions = pagy(@positions)
    if user_signed_in?
      render 'index_logged_in'
    else
      render 'index_not_logged_in'
    end
  end
end
