class Player < ApplicationRecord
  has_many :assignments
  has_many :boxes, through: :assignments, dependent: :destroy

  has_secure_password

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
