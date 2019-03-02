class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_raven_context
  before_bugsnag_notify :add_user_info_to_bugsnag

  def index
    if logged_in?
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:player_id], email: current_user.email) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def add_user_info_to_bugsnag(report)
    report.user = {
      email: current_user.email,
      id: current_user.id
    }
  end

end