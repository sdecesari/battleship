require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/battleship'
require './lib/turn'
require './lib/player'
require './lib/computer'

RSpec.describe Turn do
  it "initializes with a player/computer" do
    turn = Turn.new

    expect(turn).to be_a Turn
    expect(turn.player).to be_a Player
    expect(turn.computer).to be_a Computer
  end

  it "has a player and computer" do
    turn = Turn.new

    expect(turn.player).to be_a Player
    expect(turn.computer).to be_a Computer
  end
  it "can show state of the board" do
    turn = Turn.new
    expect(turn.show_state).to be_a String
  end
  it "take_turn updates player/computer board" do
    turn = Turn.new
    turn.take_turn("player", "A1")

    expect(turn.computer.board.cells["A1"].fired_upon?).to eq(true)
    expect(turn.computer.board.cells["A1"].render).to eq("M")
  end
end
