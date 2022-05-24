class Battleship

  attr_accessor :turn, :stop

  def initialize
    @turn = Turn.new
    @stop = false
  end

  def menu
    if @stop == true
      reset_game
      @stop = false
    end
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    answer = gets.strip.downcase
    until answer == 'p' || answer == 'q'
      puts "Invalid response"
      puts "Enter p to play. Enter q to quit."
      answer = gets.downcase.strip
    end

    if answer == 'q'
      puts "Goodbye"
    elsif answer == 'p'
      puts '=' * 40
      game_setup
    end
  end

  def game_setup
    @turn.computer.ship_placement
    @turn.player.ship_placement
    game_start
  end

  def game_start

    until @stop == true
      @turn.show_state
      results = @turn.take_turn("player", @turn.player.shots_fired)
      puts @turn.results("player", results)
      results = @turn.take_turn("computer", @turn.computer.shots_fired)
      puts @turn.results("computer", results)
      #require 'pry'; binding.pry
      game_end
    end
    menu
  end

  def game_end
    if @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true
      puts "I won!"
      @stop = true
    elsif @turn.computer.ships[0].sunk? == true && @turn.computer.ships[1].sunk? == true
      puts "You won!"
      @stop = true
    end
  end

  def reset_game()
    @turn = Turn.new

  end
end
