class Position < ApplicationRecord
  belongs_to :company
  enum career: [:general_practitioners, :surgery, :orthopedics, :dermatology, :cardiology, 
    :ophthalmology, :nutriton, :other]
    enum contract: [:clt, :pj, :match]
    has_rich_text :description
    validates :name, :career, :contract, :city, :state, :summary, presence: true
    before_save :set_slug
    
  has_many :applicants
  
  private
    
  def self.ransackable_attributes(auth_object = nil)
    ["name", "career", "city", "company_id", "contract", "created_at", "id", "publish", "remote", "slug", "state", "summary", "updated_at"]
  end

  def set_slug
    self.slug = "#{self.company.name.parameterize}-#{self.name.parameterize}"
  end
end
