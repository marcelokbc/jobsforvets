class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  
  def render_turbo_flash
    turbo_stream.update("flash", partial: "shared/flashes")
  end
end
