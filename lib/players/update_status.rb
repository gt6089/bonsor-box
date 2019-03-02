class Players::UpdateStatus
  def initialize(player)
    @player = player
  end

  def save
    @status ? activate : inactivate
    @player.save!
  end

  def activate
    return false if @player.active
    @player.active = true
  end

  def inactivate
    return false unless @player.active
    @player.active = false
  end



end