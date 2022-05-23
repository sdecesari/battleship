require 'pry'
class Computer
  attr_reader :turns, :board, :ships

  def initialize(board)
    @turns = []
    @board = board
    @ships = [
      Ship.new('cruiser', 3), Ship.new('submarine', 2)
    ]
  end

  def ship_placement
    coordinates = []
    @ships.each do |ship|
      while !board.valid_placement?(ship, coordinates)
        coordinates = board.cells.keys.sample(ship.length)
      end
      board.place(ship,coordinates)
    end
    return "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\n"
  end

  def shots_fired()
    shot = board.cells.keys.sample
      if shot != turns.include?(shot)
        @turns << shot
        return shot
      else
        return "error"
      end
  end
end
