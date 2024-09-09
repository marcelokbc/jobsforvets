class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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

  def after_sign_in_path_for(resource)
    if request.referrer == new_company_url
      new_company_path
    elsif request.referrer == admin_dashboards_url
      admin_root_path
    else
      user_redirect
    end
  end

  def user_redirect
    case current_user.role
    when "admin"
      admin_root_path
    when "company"
      new_company_path
    else
      root_path
    end
  end
end
