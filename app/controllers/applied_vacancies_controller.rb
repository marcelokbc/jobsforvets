class AppliedVacanciesController < ApplicationController
  def index
    @applicants = current_user.applicants
  end
end