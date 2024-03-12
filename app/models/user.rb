class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :company
  has_many :applicants

  enum :role, {
    admin: 0,
    company: 1,
    candidate: 2
  }

  validates :role, presence: true

  after_create :welcome_email

  private

  def welcome_email
    UserMailer.welcome(self).deliver_later
  end

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.enums.#{model_name.i18n_key}.#{enum_name}.#{enum_value}")
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
end
