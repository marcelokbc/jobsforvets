module Admin
  class PositionsController < BaseController
    before_action :authenticate_user!

    def index
      @q = Position.ransack(params[:q]) # Use Position instead of Company
      if params[:company_id].present?
        @company = Company.find(params[:company_id])
        @positions = @company.positions
        @q.result = @positions # Apply company filter to the search
      else
        @positions = @q.result(distinct: true)
      end
      @pagy, @positions = pagy(@positions)
      @companies = Company.all.order(:name)
    end
  end
end
