class ApplicantsController < ApplicationController
  before_action :set_position, only: [:index]
  def index
    @applicants = @position.applicants
  end

  def new
    @applicant = Applicant.new
    @position = Position.find(params[:position_id])
  end

  def create
    @applicant = current_user.applicants.new(applicant_params)
    @position = Position.find(params_applicant[:position_id])
    if @applicant.save
      flash[:success] = "Você se candidatou a vaga com sucesso!"
    else
      flash[:error] = "Houve um erro ao se candidatar a vaga! Tente novamente."
    end
    redirect_to new_applicant_path(position_id: @applicant.position_id)
  end
  private 

  def set_position
    begin
      @position = current_user.company.positions.find(params[:position_id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to positions_path, flash: { error: "Vaga não encontrada!" }
    end
  end

  def applicant_params
    params.require(:applicant).permit(:name, :email, :phone, :position_id)
  end
end
