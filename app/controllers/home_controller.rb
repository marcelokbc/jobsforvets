class HomeController < ApplicationController
  def index
    @q = Position.ransack(params[:q])
    @positions = @q.result(distinct: true)
    @positions = @positions.where('UPPER(name) LIKE ?', "%#{params[:name].upcase}%") if params[:name].present?
    @contracts = [["CLT", 0 ], ["PJ", 1], ["A combinar", 2]]
    @careers = [["Clínico Geral", 0], ["Cirurgia", 1], ["Ortopedia", 2], ["Dermatologia", 3], ["Cardiologia", 4], ["Oftalmologia", 5], ["Nutrição", 6], ["Outro", 7]]
    @pagy, @positions = pagy(@positions)
  end
end

# if user_signed_in?
#   render 'index_logged_in'
# else
#   render 'index_not_logged_in'
# end