class Player

  attr_accessor :board,
                :cruiser,
                :submarine,
                :turns
  def initialize(board)
    @board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @turns = []
  end

  def ship_placement
    puts "The cruiser is three units long and the submarine is two units long"
    puts @board.render
    puts "Enter the squares for the cruiser (3 spaces):"
    cruiser_coordinates = gets.chomp.upcase.split(" ")

    until @board.valid_placement?(@cruiser, cruiser_coordinates) == true do
      puts "Invalid coordinates. Please try again!"
      cruiser_coordinates = gets.chomp.upcase.split(" ")
    end
    @board.place(@cruiser, cruiser_coordinates)

    puts "Enter the squares for the submarine (2 spaces):"
    submarine_coordinates = gets.chomp.upcase.split(" ")

    until @board.valid_placement?(@submarine, submarine_coordinates) == true do
      puts "Invalid coordinates. Please try again!"
      submarine_coordinates = gets.chomp.upcase.split(" ")
    end
    @board.place(@submarine, submarine_coordinates)
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
end
