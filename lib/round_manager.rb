class RoundManager do
  def initialize(round, box_size=3)
    @round = round
    @box_size = box_size
    @players = Players.where(active: true).shuffle
    @boxes = []
  end

  def start!
    byebug
    run?
    create_boxes
    assign_players
    logger.info("#{@boxes.length} boxes created and #{@players.count} assigned") 
  end

  private

  def run?
    !@players.empty?
  end

  def create_boxes
    boxes_needed.times { @boxes << @round.boxes.create }
    @boxes
  end

  def assign_players
    @list = @players
    @boxes.each do |b|
      until @boxes.players.count == @box_size || @list.empty?
        b.players << @list.first
        @list.shift
      end
    end
  end

  def boxes_needed
    (@players.count / @box_size).round
  end
end