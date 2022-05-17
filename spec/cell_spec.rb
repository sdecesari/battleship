require './lib/ship'
require './lib/cell'
require 'pry'

describe Cell do
  before :each do
    @cell = Cell.new("B4")
  end
  it "initializes and has attributes" do
    expect(@cell).to be_a Cell
    expect(@cell.coordinate).to eq("B4")
  end
  it "starts without a ship value" do
    expect(@cell.ship).to eq(nil)
  end
  it "can test if ship is empty" do
    expect(@cell.empty?).to eq(true)
  end
  #Review if this is the best test
  it "can place a ship object" do
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)
    expect(@cell.ship).to eq(cruiser)
    expect(@cell.empty?).to eq(false)
  end
  it "starts not fired_upon" do
    cruiser = Ship.new("Cruiser", 3)
    @cell.place_ship(cruiser)

    expect(@cell.fired_upon).to eq(false)
    @cell.fire_upon

    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon).to eq(true)
  end
  it "render can show cell status: not fired" do
    cell_1 = Cell.new("B4")

    expect(@cell.render).to eq(".")
  end
  it "render can show cell status: Missed" do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon

    expect(cell_1.render).to eq("M")
  end
  it "render with ship starts out as '.'" do
    cruiser = Ship.new("Cruiser", 3)
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
    expect(cell_2.render(true)).to eq("S")
  end
  it "render can show a ship" do
    cruiser = Ship.new("Cruiser", 3)
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)

    expect(cell_2.render(true)).to eq("S")
  end
  it "render can show a hit, and sunk" do
    cruiser = Ship.new("Cruiser", 3)
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    # cell_2.fire_upon
    # cell_2.fire_upon
    # expect(cell_2.render).to eq("X")
  end
end
