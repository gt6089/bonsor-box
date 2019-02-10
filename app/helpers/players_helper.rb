module PlayersHelper
  def status_button(player)
    player.active ? 'Go inactive' : 'Go active'
  end
end
