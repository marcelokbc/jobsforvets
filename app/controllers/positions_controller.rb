class PositionsController < ApplicationController
  before_action :set_company, :set_I18n_careers, :set_I18n_contracts, except: [:public_position]
  before_action :set_position, only: [:edit, :show, :update, :destroy]

  def index
    @positions = @company.positions
    @pagy, @positions = pagy(@positions)
  end

  def show
    render :form
  end

  def new
    @position = @company.positions.new
    render :form
  end

  def create
    @position = @company.positions.new(params_position)
    if @position.save
      flash[:success] = "Vaga cadastrada com sucesso!"
      redirect_to positions_path
    else
      render :form, status: :unprocessable_entity
    end
  end

  def edit
    render :form
  end

  def update
    if @position.update(params_position)
      flash[:notice] = "Vaga atualizada com sucesso!"
      redirect_to positions_path
    else
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    if @position.destroy
      flash[:notice] = "Vaga excluída com sucesso!"
    else
      flash[:alert] = "Erro ao excluir vaga!"
    end
    redirect_to positions_path
  end

  def public_position
    @position = Position.find_by(slug: params[:slug])
    if user_signed_in?
      @applicant = current_user.applicants.new(position_id: @position.id)
      @user_applicants = UserApplicantService.new(current_user.id, @position.id).call
    end
  end

  def update_applicants_status
    @position = Position.find(params[:id])
    applicants_ids = params[:position][:applicants_status].split(",").reject(&:blank?)
    UpdateVacancyStatusService.new(@position).call
    flash[:notice] = "Status dos candidatos atualizado com sucesso!"
    redirect_to positions_path
  end  
  
  private
    def set_company
      redirect_to new_company_path if current_user.company.nil?
      @company = current_user.company
    end

    def set_position
      @position = @company.positions.find(params[:id])
    end

    def set_I18n_careers
      @careers = I18n.t('activerecord.attributes.position.careers')
    end

    def set_I18n_contracts
      @contracts = I18n.t('activerecord.attributes.position.contracts')
    end

    def params_position
      params.require(:position).permit(:name, :career, :contract, :remote, :city, :state, :summary, :description, :publish)
    end
end
