class Player

  attr_accessor :board,
                :ships,
                :turns
  def initialize(board)
    @turns = []
    @board = board
    @ships = [
      Ship.new('cruiser', 3),
      Ship.new('submarine', 2)
    ]
  end

  def ship_placement
    puts "The cruiser is three units long and the submarine is two units long"
    puts @board.render(true)
    i = 0
    while i < @ships.length
      puts "Enter the squares for the #{@ships[i].name} (#{@ships[i].length} spaces):"
      ship_coordinates = gets.chomp.upcase.split(" ")

      until @board.valid_placement?(@ships[i], ship_coordinates) == true do
        puts "Invalid coordinates. Please try again!"
        ship_coordinates = gets.chomp.upcase.split(" ")
      end
      @board.place(@ships[i], ship_coordinates)
      puts @board.render(true)
      i += 1
    end
  end

  def shots_fired
    puts "Enter the coordinate for your shot:"
    player_coordinates = gets.chomp.capitalize
    until @board.valid_coordinate?(player_coordinates) == true && @turns.include?(player_coordinates) == false do
      puts "Please enter a valid coordinate:"
      player_coordinates = gets.chomp.capitalize
    end
    @turns << player_coordinates
    return @turns.last
  end
  
  def add_ship(ship)
    @ships << ship
  end
end
