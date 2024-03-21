class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = current_user.build_company
  end

  def edit
    @company = current_user.company
  end

  def create
    @company = current_user.build_company(company_params)
    if @company.save
      flash[:notice] = "Empresa cadastrada com sucesso."
      redirect_to root_path
    else
      flash[:error] = "Erro ao cadastrar empresa."
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    @company = current_user.company
    if @company.update(company_params)
      flash[:notice] = "Empresa atualizada com sucesso."
      redirect_to root_path
    else
      flash[:error] = "Erro ao atualizar empresa."
      render :edit, status: :unprocessable_entity
    end
  end

  def dashboard
    authorize :company, :dashboard?
    @company = current_user.company
    @positions = @company.positions
    @positions_without_applicants = @positions.select { |position| position.applicants.empty? }
    @positions_with_applicants = @positions.select { |position| position.applicants.any? }
    @applicants = @positions_with_applicants.map { |position| position.applicants }.flatten 
  end

  private
  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a performar essa ação."
    redirect_back(fallback_location: root_path)
  end
end
