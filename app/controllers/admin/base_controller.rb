module Admin
  class BaseController < ApplicationController
    before_action :check_admin

    private

    def layout
      'admin_layout'
    end

    def check_admin
      raise Pundit::NotAuthorizedError unless current_user.admin?
    end
  end
end