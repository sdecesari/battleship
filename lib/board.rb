class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    require 'pry'; binding.pry
  letters = coordinates.map {|coordinate| coordinate[0]}
  numbers = coordinates.map {|coordinate| coordinate[1]}
  ship_coordinates = coordinates.map {|coordinate| @cells[coordinate].empty?}
    if ship.length != coordinates.length
      false
    elsif ship_coordinates.include?(false) == true
      false
    elsif letters.uniq.length == 1 && (numbers.min..numbers.max).to_a == numbers
      true
    elsif (letters.min..letters.max).to_a == letters && numbers.uniq.length == 1
      true
    elsif (letters.min..letters.max).to_a == letters && (numbers.min..numbers.max).to_a == numbers
      false
    elsif letters.uniq.length == 1 && numbers.uniq.length == numbers
      false
    else
      false
    end
  end

  def place(ship, ship_coordinates)
    ship_coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end
end
