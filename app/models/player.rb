class Player < ApplicationRecord
  attr_accessor :remember_token

  has_many :assignments
  has_many :boxes, through: :assignments, dependent: :destroy

  has_secure_password

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # returns hash digest of given string
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def remember
    self.remember_token = Player.new_token
    update_attribute(:remember_digest, Player.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
