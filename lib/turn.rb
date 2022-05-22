require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/battleship'

class Turn
  attr_reader :player_board, :computer_board, :player, :computer

  def initialize()
    @player = Player.new
    @computer = Computer.new
    @player_board = Board.new
    @computer_board = Board.new
  end

  def show_state(show_ship = false)
    spacer = "============"
    p spacer + "COMPUTER BOARD" + spacer + "\n" + @computer_board.render(show_ship) + "\n"  + spacer +  "PLAYER BOARD" + spacer + "\n" + @player_board.render(show_ship) + "\n"
  end

  def take_turn(player, coordinate)
    if player == "player"
      @computer_board.cells[coordinate].fire_upon
      return computer_board.cells[coordinate].render
    elsif player == "computer"
      @player_board.cells[coordinate].fire_upon
      return player_board.cells[coordinate].render
    end
  end
end
