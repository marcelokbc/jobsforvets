module Admin
  class DashboardsController < BaseController
    def index
      # preciso saber quantas empresas, usuários, vagas e candidatos existem
      @companies_count = Company.count
      @company_name = Company.all.map(&:name).join(', ')
      @users = User.all
      @positions_count = Position.count
      @applicants = Applicant.all
    end    
  end
end