class Battleship

  attr_accessor :turn, :game_end

  def initialize
    @turn = Turn.new
    @game_end = false
  end

  def menu
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
    @turn.show_state
    results = @turn.take_turn("player", @turn.player.shots_fired)
    #require 'pry'; binding.pry
    puts @turn.results("player", results)
    results = @turn.take_turn("computer", @turn.computer.shots_fired)
    puts @turn.results("computer", results)
    game_start
     # if game_end !=true
     #   game_start
     # else
     #   game_end
     # end
    #until game_end do

    # game_end
  end

  def game_end
    if @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true
      puts "I won!"
    elsif @turn.computer.cruiser.sunk? == true && @turn.computer.submarine.sunk? == true
      puts "You won!"
    end
    menu
  end
end
