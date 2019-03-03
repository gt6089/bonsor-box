class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_raven_context

  def index
    if logged_in?
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end

  private

  def set_raven_context
    unless session[:player_id].nil?
      Raven.user_context(id: session[:player_id], email: current_user.email) # or anything else in session
    end
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

end