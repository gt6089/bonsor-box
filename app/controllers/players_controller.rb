class PlayersController < ApplicationController
  before_action :check_login, :find_player, only: %i[edit show update status]
  before_action :authorize, only: %i[edit update status]

  def index
    @players = Player.active
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash.now[:success] = 'Welcome to BonsorBox!'
      redirect_to @player
    else
      render 'new'
    end
  end

  def new
    @player = Player.new
  end

  def show
  end

  def edit
  end

  def update
    if @player.update(player_params)
      flash.now[:success] = 'Profile updated.'
    else
      flash.now[:danger] = 'Could not update your profile.'
    end
    render 'edit'
  end

  def destroy
  end

  def status
    byebug
    p = Players::UpdateStatus.new(@player)
    if p.save
      flash.now[:success] = 'Your status has been updated.'
    else
      flash.now[:danger] = 'Your status could not be updated.'
    end
    render 'edit'
  end

  private

  def check_login
    unless logged_in?
      flash[:danger] = 'You must be logged in to do that.'
      redirect_to login_path
    end
  end

  def authorize
    unless current_user?(@player)
      flash[:danger] = 'You are not authorized to do that.'
      redirect_to root_path
    end
  end

  def find_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :phone, :preferred_contact, :password, :password_confirmation)
  end

end
