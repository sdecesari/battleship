class Turn
  attr_reader :player,
              :computer
  def initialize(board_size)
    @computer_board = Board.new(board_size)
    @player_board = Board.new(board_size)
    @player = Player.new(@player_board)
    @computer = Computer.new(@computer_board)
  end

  def show_state(show_ship = false)
    spacer = "=" * 12
    puts spacer + "COMPUTER BOARD" + spacer
    puts @computer.board.render(true)
    puts spacer +  "PLAYER BOARD" + spacer
    puts @player.board.render(true)
  end

  def take_turn(player, coordinate)
    if player == "player"
      @computer.board.cells[coordinate].fire_upon
        return @computer.board.cells[coordinate].render
    elsif player == "computer"
      @player.board.cells[coordinate].fire_upon
        return @player.board.cells[coordinate].render
    end
  end

  def results(player, result)
    results = result
    if player == "player"
      if result == "M"
        results = "Your shot on #{@player.turns.last} was a miss."
      elsif result == "X"
        results = "Your shot on #{@player.turns.last} sunk my #{@computer.board.cells[@player.turns.last].ship.name}!"
      elsif result == "H"
        results = "Your shot on #{@player.turns.last} was a hit!"
      end
    elsif player == "computer"
      if result == "M"
        results = "My shot on #{@computer.turns.last} was a miss."
      elsif result == "X"
        results = "My shot on #{@computer.turns.last} sunk your #{@player.board.cells[@computer.turns.last].ship.name}!"
      elsif result == "H"
        results = "My shot on #{@computer.turns.last} was a hit!"
      end
      return results
    end
  end
end
