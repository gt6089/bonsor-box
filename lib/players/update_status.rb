class Players::UpdateStatus
  def initialize(player)
    @player = player
  end

  def save
    @player.active ? inactivate : activate
  end

  def errors
    @player.errors
  end

  def activate
    return false if @player.active
    @player.update(active: true)
  end

  def inactivate
    return false unless @player.active
    @player.update(active: false)
  end
end