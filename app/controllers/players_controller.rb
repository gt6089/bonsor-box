class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = 'Welcome to BonsorBox!'
      redirect_to @player
    else
      render 'new'
    end
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :phone, :preferred_contact, :password, :password_confirmation)
  end

end