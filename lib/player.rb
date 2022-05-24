class Player

  attr_accessor :player_board,
                :cruiser,
                :submarine,
                :turns
  def initialize(board)
    @player_board = board
    @cruiser = Ship.new('cruiser', 3)
    @submarine = Ship.new('submarine', 2)
    @turns = []
  end

  def ship_placement
    puts "The cruiser is three units long and the submarine is two units long"
    puts @player_board.render
    puts "Enter the squares for the cruiser (3 spaces):"
    cruiser_coordinates = gets.chomp.upcase.split(" ")

    until @player_board.valid_placement?(@cruiser, cruiser_coordinates) == true do
      puts "Invalid coordinates. Please try again!"
      cruiser_coordinates = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@cruiser, cruiser_coordinates)

    puts "Enter the squares for the submarine (2 spaces):"
    submarine_coordinates = gets.chomp.upcase.split(" ")

    until @player_board.valid_placement?(@submarine, submarine_coordinates) == true do
      puts "Invalid coordinates. Please try again!"
      submarine_coordinates = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@submarine, submarine_coordinates)
  end

  def shots_fired
    puts "Enter the coordinate for your shot:"
    player_coordinates = gets.chomp.capitalize

    while @player_board.valid_coordinate?(player_coordinates) == false do
      puts "Please enter a valid coordinate:"
      player_coordinates = gets.chomp.capitalize

    end
    @turns << player_coordinates
    #require 'pry'; binding.pry
    return @turns.last
  end
end
