require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/battleship'

class Turn
  attr_reader :player_board, :computer_board
  
  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end
end
