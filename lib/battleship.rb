class Battleship

  attr_accessor :turn,
                :stop
  def initialize
    @turn = Turn.new(4)
    @stop = false
  end

  def menu
    if @stop == true
      self.reset_game
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
        game_setup
      elsif answer == "y"
        puts "Enter a number between 5 and 10."
        user_board = gets.strip.to_i
        until user_board > 4 && user_board < 11
          puts "No. Enter a number between 5 and 10."
          user_board = gets.strip.to_i
        end
        @turn = Turn.new(user_board)
        custom_ships
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
  end

  def custom_ships()
    puts '=' * 40
    puts "Would you like to add custom ships?"
    puts "You can add up to 3 additional ships. Y/N?"
    answer = gets.strip.downcase
    until answer == "y" || answer == "n"
      puts "Invalid response! Y/N?"
      answer = gets.strip.downcase
    end
    if answer == "n"
      game_setup
    elsif answer == "y"
      puts "How many additional ships would you like to add?(3 max)?"
      answer = gets.strip.to_i
      until answer > 0 && answer < 4
        puts "Invalid response! Choose a number between 1 and 3!"
        answer = gets.strip.to_i
      end
      ship_name = ""
      ship_size = 0
      ships_added = 0
      while ships_added < answer
        puts "Enter your ship name."
        ship_name = gets.chomp
        puts "Enter your ship size."
        ship_size = gets.chomp.to_i
        until ship_size <= @turn.player.board.board_size
          puts "Too big. Size less than #{@turn.player.board.size} please."
          ship_size = gets.chomp.to_i
        end
        @turn.player.ships << Ship.new(ship_name, ship_size)
        @turn.computer.ships << Ship.new(ship_name, ship_size)
        ships_added += 1
      end
      game_setup
    end
  end

  def reset_game()
    @turn = Turn.new(4)
  end
end
