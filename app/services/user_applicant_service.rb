class UserApplicantService
  attr_reader :user_id, :position_id

  def initialize(user_id, position_id)
    @user_id = user_id
    @position_id = position_id
  end

  def call
    find_user_applicants
  end

  private

  def find_user_applicants
    Applicant.where(user_id: user_id, position_id: position_id).present?
  end
end