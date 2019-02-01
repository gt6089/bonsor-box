class Box < ApplicationRecord
  belongs_to :round
  has_many :assignments
  has_many :players, through: :assignments, dependent: :destroy

end
