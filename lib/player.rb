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
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The cruiser is three units long and the submarine is two units long"
    p @player_board.render
    p "Enter the squares for the cruiser (3 spaces):"
    cruiser_coordinates = gets.chomp.upcase.split(" ")

    until @player_board.valid_placement?(@cruiser, cruiser_coordinates) == true do
      p "Invalid coordinates. Please try again!"
      cruiser_coordinates = gets.chomp.upcase.split(" ")
    end
    @board.place(@cruiser, cruiser_coordinates)

    p "Enter the squares for the submarine (2 spaces):"
    submarine_coordinates = gets.chomp.upcase.split(" ")

    until @player_board.valid_placement?(@submarine, submarine_coordinates) == true do
      p "Invalid coordinates. Please try again!"
      submarine_coordinates = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@submarine, submarine_coordinates)
  end

  def shots_fired
    p "Enter the coordinate for your shot:"
    player_coordinates = gets.chomp.capitalize

    until @player_board.valid_coordinate?(player_coordinates) == true do
      p "Please enter a valid coordinate:"
      player_coordinates = gets.chomp.capitalize
        @turns << player_coordinates
    end
    turns
  end
end
