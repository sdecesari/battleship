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
    expect(cell.empty?).to eq(true)

  end
end
