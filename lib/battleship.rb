class Battleship

  attr_accessor :turn

  def initialize
    @turn = Turn.new
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
    #@turn.show_state
    puts @turn.results("computer", results)
    # until game_end do
    # game_end
  end

  def game_end
    if @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true
      puts "I won!"
    else @turn.computer.crusier.sunk? == true && @turn.computer.submarine.sunk? == true
      puts "You won!"
    end
    menu
  end
end
