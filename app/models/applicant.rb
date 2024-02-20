class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position

  validates :name, :email, :phone, :position_id, presence: true
end
