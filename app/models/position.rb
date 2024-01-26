class Position < ApplicationRecord
  belongs_to :company

  enum career: [:general_practitioners, :surgery, :ortophdics, :dermatology, :cardiology, 
                :ophthalmology, :nutriton, :other]
  enum contract: [:clt, :pj, :match]

  has_rich_text :description
  
  validates :name, :career, :contract, :city, :state, :summary, presence: true
end
