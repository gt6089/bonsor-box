class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
    if logged_in?
      redirect_to @current_user
    else
      redirect_to login_path
    end
  end

end