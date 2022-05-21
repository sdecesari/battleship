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
  end
end
