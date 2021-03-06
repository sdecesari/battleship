require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/battleship'
require './lib/turn'
require './lib/player'
require './lib/computer'

RSpec.describe Turn do
  before :each do
    @turn = Turn.new(4)
  end

  it "exists" do
    expect(@turn).to be_a Turn
  end

  it "has a player and computer" do
    expect(@turn.player).to be_a Player
    expect(@turn.computer).to be_a Computer
  end

  it "take_turn updates player/computer board" do
    @turn.take_turn("player", "A1")

    expect(@turn.computer.board.cells["A1"].fired_upon?).to eq(true)
    expect(@turn.computer.board.cells["A1"].render).to eq("M")
  end
end
