class Round < ApplicationRecord
  has_many :boxes

  def current?
    Date.current > start_time && Date.current < end_time
  end

  def end_time
    start_time + duration
  end
end
