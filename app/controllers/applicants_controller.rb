class ApplicantsController < ApplicationController
  before_action :set_position, only: [:index]
  def index
    @applicants = @position.applicants
    respond_to do |format|
      format.html
      format.csv { send_data @position.applicants.as_csv, filename: "applicants.csv" }
      format.zip do
        UserMailer.export_resume(current_user, @position).deliver_now
        flash[:success] = "Curriculos exportados com sucesso! Verifique seu email."
        redirect_to action: :index
      end
    end
    @pagy, @applicants = pagy(@applicants)
  end

  def new
    @applicant = Applicant.new
    @position = Position.find(params[:position_id])
  end

  def create
    @applicant = current_user.applicants.new(applicant_params)
    @position = Position.find(applicant_params[:position_id])
    if @applicant.save
      flash[:success] = "Você se candidatou a vaga com sucesso!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
      flash[:error] = "Houve um erro ao se candidatar a vaga! Tente novamente."
    end
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
    params.require(:applicant).permit(:name, :email, :phone, :resume, :position_id)
  end
end
