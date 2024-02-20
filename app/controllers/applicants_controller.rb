class ApplicantsController < ApplicationController
  def index
  end

  def new
    @applicant = Applicant.new
    @position = Position.find(params[:position_id])
  end

  def create
    @applicant = current_user.applicants.new(applicant_params)
    if @applicant.save
      flash[:success] = "Você se candidatou a vaga com sucesso!"
    else
      flash[:error] = "Houve um erro ao se candidatar a vaga! Tente novamente."
    end
    redirect_to new_applicant_path(position_id: @applicant.position_id)
  end
  private 

  def applicant_params
    params.require(:applicant).permit(:name, :email, :phone, :position_id)
  end
end
