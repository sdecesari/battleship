class Battleship

  def menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    answer = gets.strip.downcase
    until answer == 'p' || answer == 'q'
      p "Invalid response"
      p "Enter p to play. Enter q to quit."
      answer = gets.downcase.strip
    end

    if answer == 'q'
      p "Goodbye"
    else answer == 'p'
      p "Let's play!"
    end
    game_setup
  end

  def game_setup
    #computer ship placement
    p computer.ship_placement
    #player ship placement
    player.ship_placement
    #call game_start
  end

  def game_start
    turn.show_state
    p turn.results("computer", computer.shots_fired)
    player.shots_fired
    turn.show_state

  end
  #calls game_start
  #calls game_end
  #calls menu
end
