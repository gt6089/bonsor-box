module SessionsHelper
  def log_in(player)
    session[:player_id] = player.id
  end

  def current_user
    return nil unless session[:player_id]
    @current_user ||= Player.find_by(id: session[:player_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:player_id)
    @current_user = nil
  end
end
