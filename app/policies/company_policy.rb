class CompanyPolicy < ApplicationPolicy
  def dashboard?
    user.role == "company"
  end
end
