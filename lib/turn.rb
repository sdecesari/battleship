class Turn
  attr_reader :player_board,
              :computer_board,
              :player,
              :computer
  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @player = Player.new(@player_board)
    @computer = Computer.new(@computer_board)
  end

  def show_state(show_ship = false)
    spacer = "============"
    p spacer + "COMPUTER BOARD" + spacer + "\n" + @computer.computer_board.render(show_ship) + "\n"  + spacer +  "PLAYER BOARD" + spacer + "\n" + @player.player_board.render(show_ship) + "\n"
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

  def results(player, result)
    results = ""
    if player == "player"
      if result == "M"
        results = "Your shot on #{player.turns.last} was a miss."
      elsif result == "H"
        results = "Your shot on #{player.turns.last} was a hit!"
      elsif result == "X"
        results = "Your shot on #{player.turns.last} sunk my #{computer.board.cells[player.turns.last].name}!"
      end
    elsif player == "computer"
      if result == "M"
        results = "My shot on #{computer.turns.last} was a miss."
      elsif result == "H"
        results = "My shot on #{computer.turns.last} was a hit!"
      elsif result == "X"
        results = "My shot on #{computer.turns.last} sunk your #{player.board.cells[player.turns.last].name}!"
      end
      return results
  end
end
