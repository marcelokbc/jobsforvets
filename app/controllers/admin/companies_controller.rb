module Admin
  class CompaniesController < BaseController
    before_action :set_company, only: [:edit, :update, :destroy, :show]

    def index
      @q = Company.ransack(params[:q])
      @companies = @q.result(distinct: true).order(:name)
      @pagy, @companies = pagy(@companies)
    end

    def show
      render :form
    end

    def new
      @company = Company.new
      render :form
    end

    def create
      @company = current_user.build_company(company_params)
      if @company.save
        flash[:success] = "Empresa criada com sucesso!"
        redirect_to action: :index
      else
        render :form, status: :unprocessable_entity
      end
    end

    def edit
      render :form
    end

    def update
      if @company.update(companies_params)
        flash[:notice] = "Empresa atualizada com sucesso!"
        redirect_to action: :index
      else
        render :form, status: :unprocessable_entity
      end
    end

    def destroy
      @company.destroy
      redirect_to action: :index
    end

    private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(
        :name,
        :logo,
        :url,
      )
    end
  end
end
  