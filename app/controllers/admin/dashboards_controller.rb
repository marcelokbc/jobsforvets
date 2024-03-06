module Admin
  class DashboardsController < BaseController
    def index
      @companies = Company.all
      @users = User.all
      @positions = Position.all
      @applicants = Applicant.all
    end
  end
end