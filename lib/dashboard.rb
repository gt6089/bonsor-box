class Dashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def current_box
    @current_box ||= user.boxes.includes(:round).find { |b| b.current }
  end

  def opponents
    current_box&.players.select(:id, :first_name, :last_name, :email, :phone, :preferred_contact).order(:first_name)
        .reject { |p| p.id == user.id }
  end

end