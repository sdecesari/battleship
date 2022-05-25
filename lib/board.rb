class Board
  attr_reader :cells
  attr_accessor :board_size
  def initialize(board_size = 4)
    @board_size = board_size
    @cells = Hash.new()
    row = 65
    col = 1
    end_row = 65 + board_size
    while row < end_row
      while col <= board_size
        coordinate = "#{row.chr}#{col}"
        @cells[coordinate] = Cell.new(coordinate)
        col +=1
      end
      col = 1
      row += 1
    end
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
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

  def render(show_ship = false)
    coordinates = @cells.keys
    letters = coordinates.map {|coordinate| coordinate[0]}
    numbers = coordinates.map {|coordinate| coordinate[1]}
    board_string = "  "

    numbers.uniq.each do |number|
      board_string += (number.to_s + " ")
    end
    board_string += "\n"
    row = 0
    col = 0
    current_cell = 0
    while row < board_size
      board_string += (letters.uniq[row] + " ")
      while col < board_size
        board_string += @cells[coordinates[current_cell]].render(show_ship) + " "
        col += 1
        current_cell += 1
      end
      col = 0
      board_string += "\n"
      row += 1
    end
    return board_string
  end
end
