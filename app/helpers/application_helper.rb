module ApplicationHelper

  def logger
    @logger ||= Rails.logger
  end

end
