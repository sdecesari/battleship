class Battleship

  attr_accessor :turn, :stop

  def initialize
    @turn = Turn.new(4)
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
      puts "Would you like a custom board size? Y/N?"
      answer = gets.strip.downcase
      until answer == "y" || answer == "n"
        puts "Invalid response! Y/N?"
        answer = gets.strip.downcase
      end
      if answer == "n"
        self.game_setup
      elsif answer == "y"
        puts "Enter a number between 5 and 15."
        user_board = gets.strip.to_i
        until user_board > 4 && user_board < 16
          puts "No. Enter a number between 5 and 15."
          user_board = gets.strip.to_i
        end
        @turn = Turn.new(user_board)
        self.game_setup
      end
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
      game_end
    end
    menu
  end

  def game_end
      player_sunk = @turn.player.ships.count{|ship|ship.sunk?}

      computer_sunk = @turn.computer.ships.count{|ship|ship.sunk?}
      if computer_sunk == @turn.computer.ships.length
        puts "You won!"
        @stop = true
      elsif player_sunk == @turn.player.ships.length
        puts "I won!"
        @stop = true
      end

      #require 'pry'; binding.pry
      # i = 0
      # while i < @turn.player.ships.length
      #
      #   if @turn.player.ships[i].sunk?
      #     player_sunk +=1
      #     i += 1
      #   elsif @turn.computer.ships[i].sunk?
      #     computer_sunk +=1
      #     i += 1
      #   end
      # end
      # if computer_sunk == @turn.computer.ships.length
      #   puts "You won!"
      #   @stop = true
      #
      # elsif player_sunk == @turn.player.ships.length
      #   puts "I won!"
      #   @stop = true
      # end

    # if @turn.player.cruiser.sunk? == true && @turn.player.submarine.sunk? == true
    #   puts "I won!"
    #   @stop = true
    # elsif @turn.computer.ships[0].sunk? == true && @turn.computer.ships[1].sunk? == true
    #   puts "You won!"
    #   @stop = true
    # end
  end

  def reset_game()
    @turn = Turn.new(4)
  end
end
