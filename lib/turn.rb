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

  def show_state(show_ship = false)
    spacer = "============"
    p spacer + "COMPUTER BOARD" + spacer + "\n" + @computer_board.render(show_ship) + "\n"  + spacer +  "PLAYER BOARD" + spacer + "\n" + @player_board.render(show_ship) + "\n"
  end
end
