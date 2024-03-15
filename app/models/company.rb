class Company < ApplicationRecord
  belongs_to :user
  has_many :positions
  has_one_attached :logo

  validates :name, :url, :logo, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["logo_attachment", "logo_blob", "positions", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at", "url", "user_id"]
  end
end
