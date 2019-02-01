class Player < ApplicationRecord
  has_many :assignments
  has_many :boxes, through: :assignments, dependent: :destroy

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
