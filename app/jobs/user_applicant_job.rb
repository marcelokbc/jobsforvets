class UserApplicantJob
  attr_reader :user_id

  def initialize(user_id)
    @user_id = user_id
  end

  def call
    Applicant.where(user_id: user_id)
  end
end