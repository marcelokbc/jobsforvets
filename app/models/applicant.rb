require 'csv'

class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position
  has_one_attached :resume

  enum status: { pending: 0, waiting_for_feedback: 1, approved: 2, rejected: 3 }

  validates :first_name, :last_name, :email, :phone, :position_id, 
            :resume, :zipcode, :street, :number, :neighborhood, :city,
            :state, presence: true

  validate :correct_resume_mime_type

  def self.as_csv
    attributes = %w{id name email phone}

    CSV.generate(headers: true) do |csv|
      csv.add_row attributes

      all.each do |applicant|
        csv.add_row attributes.map { |attr| applicant.send(attr) }
      end
    end
  end

  private

  def correct_resume_mime_type
    if resume.attached? && !resume.content_type.in?(%w(application/pdf))
      errors.add(:resume, 'Foi enviado um arquivo com formato inválido. Por favor, envie um arquivo PDF.')
    end
  end
end
