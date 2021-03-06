require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before :each do
    @board = Board.new(4)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it "exists and has attr_reader" do
    expect(@board).to be_a Board
    expect(@board.cells).to be_a Hash
  end

  it "can still tell if a coordinate is on board with new board size" do
    @board_2 = Board.new(6)
    expect(@board_2.valid_coordinate?("A1")).to eq(true)
    expect(@board_2.valid_coordinate?("D4")).to eq(true)
    expect(@board_2.valid_coordinate?("A5")).to eq(true)
    expect(@board_2.valid_coordinate?("G1")).to eq(false)
    expect(@board_2.valid_coordinate?("A22")).to eq(false)
  end
  
  it "valid_placement? false if ship length not same as coordinate range" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it "can check for consecutive cells" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq false
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq false
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"]))
    expect(@board.valid_placement?(@submarine, ["C1", "B1"]))
  end

  it "can check coordinates are not diagonal" do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq false
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq false
  end

  it "can check the placement is valid" do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq true
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq true
  end

  it "can place a ship" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    expect(cell_1.ship).to eq(@cruiser)
    expect(cell_2.ship).to eq(@cruiser)
    expect(cell_3.ship).to eq(@cruiser)
  end

  it "cells with a specific ship are equal" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    expect(cell_3.ship).to eq(cell_2.ship)
  end

  it "won't allow overlapping ships" do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
  end

  it "can render the initial board" do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  it " render can show placed ships" do
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
