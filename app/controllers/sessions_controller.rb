class SessionsController < ApplicationController
  def new
  end

  def create
    player = Player.find_by(email: params[:session][:email].downcase)

    if player && player.authenticate(params[:session][:password])
      log_in player
      redirect_to player
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end

    def destroy
      log_out
      redirect_to root_path
    end
  end

end
