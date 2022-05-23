require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/battleship'
require './lib/computer'

RSpec.describe Computer do
  before :each do
    @board = Board.new
    @computer = Computer.new(@board)
  end

  it "initializes" do
    expect(@computer).to be_a Computer
  end

  it "has ships" do
    expect(@computer.ships[0]).to be_a Ship
    expect(@computer.ships[1]).to be_a Ship
  end

  it "has a board" do
    expect(@computer.board).to be_a Board
  end

  it "ship_placement returns true when ships are placed correctly" do
    expect(@computer.ship_placement).to eq(true)
  end
  
  it "can select a coordinate to fire on" do
    @computer.shots_fired
    expect(@computer.turns[0]).to be_a String
    expect(@computer.turns[0]).not_to eq("error")
  end
end
