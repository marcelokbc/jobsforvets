class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :company
  has_many :applicants

  enum role: { admin: 0, company: 1, candidate: 2 }

  validates :role, presence: true

  after_create :welcome_email

  private

  def welcome_email
    UserMailer.welcome(self).deliver_later
  end
end
