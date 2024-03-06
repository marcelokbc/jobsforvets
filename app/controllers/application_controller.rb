class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend
  include Pundit::Authorization

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    user_redirect
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  
  def render_turbo_flash
    turbo_stream.update("flash", partial: "shared/flashes")
  end

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a performar essa ação."
    redirect_back(fallback_location: root_path)
  end

  def user_redirect
    case current_user.role
    when "admin"
      admin_root_path
    else
      root_path
    end
  end
end
