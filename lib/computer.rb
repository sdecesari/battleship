class Computer
  attr_reader :turns, :board, :cruiser, :submarine

  def initialize()
    @turns = []
    @board = Board.new
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
  end
end
