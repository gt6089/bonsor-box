class SessionsController < ApplicationController
  def new
  end

  def create
    player = Player.find_by(email: params[:session][:email].downcase)

    if player && player.authenticate(params[:session][:password])
      log_in player
      params[:session][:remember_me] == '1' ? remember(player) : forget(player)
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash.now[:success] = "You have been logged out."
    redirect_to login_path
  end

end
