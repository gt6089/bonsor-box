module SessionsHelper
  def log_in(player)
    session[:player_id] = player.id
  end

  def remember(player)
    player.remember
    cookies.permanent.signed[:player_id] = player.id
    cookies.permanent[:remember_token] = player.remember_token
  end

  def current_user
    if (player_id = session[:player_id])
      @current_user ||= Player.find_by(id: player_id)
    elsif (player_id = cookies.signed[:player_id])
      player = Player.find_by(id: player_id)
      if player && player.authenticated?(cookies[:remember_token])
        log_in player
        @current_user = player
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(player)
    player.forget
    cookies.delete(:player_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:player_id)
    @current_user = nil
  end
end
