class RoundManager
  attr_reader :round, :players, :box_size

  def initialize(round, box_size=3)
    @round = round
    @box_size = box_size
    @players = Player.where(active: true).shuffle
    @boxes = []
    @logger = Rails.logger
  end

  def start!
    return false unless run?
    create_boxes && assign_players
    @logger.info("#{@boxes.length} boxes created and #{players.count} assigned")
    true
  end

  def regenerate
    destroy_boxes
    start!
  end

  private

  def run?
    !players.empty?
  end

  def create_boxes
    boxes_needed.times { @boxes << round.boxes.create }
    @boxes
  end

  def destroy_boxes
    round.boxes.destroy_all
  end

  def assign_players
    list = players.dup
    @boxes.each do |b|
      until b.players.count == box_size || list.empty?
        b.players << list.first
        list.shift
      end
    end
  end

  def boxes_needed
    (players.count.to_f / box_size.to_f).round
  end
end