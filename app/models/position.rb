class Position < ApplicationRecord
  belongs_to :company

  enum career: [:general_practitioners, :surgery, :ortophdics, :dermatology, :cardiology, 
                :ophthalmology, :nutriton, :other]
  enum contract: [:clt, :pj, :match]

  validates :name, :career, :contract, :city, :state, :summary, :description, presence: true
end
