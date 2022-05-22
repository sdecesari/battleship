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
  it "can show board states" do
    board_1 = Board.new()
    board_2 = Board.new()
    turn = Turn.new(board_1, board_2)

    expect(turn.show_state).to eq("============" + "COMPUTER BOARD" + "============" + "\n" + board_2.render + "\n" + "============" + "PLAYER BOARD" + "============" + "\n" + board_1.render + "\n")
  end
  it "take_turn updates player/computer board" do
    player_board = Board.new()
    computer_board = Board.new()
    turn = Turn.new(player_board, computer_board)
    turn.take_turn("player", "A1")

    expect(computer_board.cells["A1"].fired_upon?).to eq(true)
    expect(computer_board.cells["A1"].render).to eq("M")
  end
end
