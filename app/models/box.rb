class Box < ApplicationRecord
  belongs_to :round
  has_many :assignments
  has_many :players, through: :assignments, dependent: :destroy

  def current
    self.round.current?
  end

end
