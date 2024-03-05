class UpdateVacancyStatusService
  def initialize(position)
    @position = position
  end

  def call
    @position.applicants.each do |applicant|
      next_status = next_status(applicant.status)
      applicant.update(status: next_status)
    end
  end

  private

  def next_status(current_status)
    statuses = Applicant.statuses.keys
    current_index = statuses.index(current_status.to_s)
    next_index = (current_index + 1) % statuses.length
    statuses[next_index]
  end
end