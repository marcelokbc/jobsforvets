class PositionsController < ApplicationController
  before_action :set_company, :set_I18n_careers, :set_I18n_contracts, except: [:public_position]
  before_action :set_position, only: [:edit, :show, :update]

  def index
    @positions = @company.positions
    # @pagy, @positions = pagy(@positions)
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
  end

  def public_position
    @position = Position.find_by(slug: params[:slug])
    if user_signed_in?
      @applicant = current_user.applicants.new(position_id: @position.id)
      @user_applicants = UserApplicantJob.new(current_user.id, @position.id).call
      logger.debug "@applicant: #{@applicant.inspect}" # Add this line for debugging
    end
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
