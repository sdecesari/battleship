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

  def show_state
    spacer = "============"
    p spacer + "COMPUTER BOARD" + spacer + "\n" + @computer_board.render + "\n" + spacer + "PLAYER BOARD" + spacer + "\n" + @player_board.render + "\n"
    # puts @computer_board.render + "\n"
    # puts "============PLAYER BOARD============\n"
    # puts @player_board.render + "\n"

  end
end
