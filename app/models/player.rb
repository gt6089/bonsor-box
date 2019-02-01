class Player < ApplicationRecord
  has_many :boxes, through: :rounds

  has_secure_password
end
