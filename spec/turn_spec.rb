require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/battleship'
require './lib/turn'

describe Turn do
  it "initializes with 2 boards" do
    board_1 = Board.new()
    board_2 = Board.new()
    turn = Turn.new(board_1, board_2)

    expect(turn.player_board).to eq(board_1)
    expect(turn.computer_board).to eq(board_2)
  end
end
