module ApplicationHelper

  def logger
    @logger ||= Rails.logger
  end

  def current_round
    Round.current
  end

  def time_to_round_end
    distance_of_time_in_words_to_now(current_round.end_time)
  end

  def current_round_end
    Round.current.end_time.strftime('%A, %b %e')
  end

  def format_preferred_contact(player)
    if player.preferred_contact.empty?
      "text or email"
    else
      player.preferred_contact.capitalize
    end
  end

  def full_name(player)
    "#{player.first_name} #{player.last_name}"
  end

end
