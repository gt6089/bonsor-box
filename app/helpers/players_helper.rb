module PlayersHelper
  def status(player)
    player.active ? 'active' : 'inactive'
  end

  def status_button(player)
    player.active ? 'inactive' : 'active'
  end
end
