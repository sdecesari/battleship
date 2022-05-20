require './lib/ship'
require './lib/board'
require 'pry'

class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      return true
    else
      return false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if empty? != true
      @ship.hit
    end
    @fired_upon = true
  end

  def render(show_ship = false)
    if empty? == false && show_ship == true
      return "S"
    elsif @fired_upon != true
      return "."
    elsif @fired_upon == true && empty? == true
      return "M"
    elsif @fired_upon == true && @ship.sunk? == true
      return "X"
    elsif @fired_upon == true && empty? == false
      return "H"
    end
  end
end
