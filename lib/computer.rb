class Computer
  attr_reader :turns,
              :board,
              :ships
  def initialize(board)
    @turns = []
    @board = board
    @ships = [
      Ship.new('cruiser', 3), Ship.new('submarine', 2)
    ]
  end

  def ship_placement
    coordinates = []
    @ships.each do |ship|
      while !@board.valid_placement?(ship, coordinates)
        coordinates = @board.cells.keys.sample(ship.length)
      end
      @board.place(ship,coordinates)
    end
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your #{@ships.length} ships."
    puts "=" * 40
  end

  def shots_fired
    shot = @board.cells.keys.sample
      until !@turns.include?(shot)
        shot = @board.cells.keys.sample
      end
      @turns << shot
      return shot
  end

  def add_ship(ship)
    @ships << ship
  end
end
