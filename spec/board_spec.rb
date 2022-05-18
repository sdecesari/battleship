require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

RSpec.describe Board do
  before :each do
    @board = Board.new
  end
  it "exists and has attr_reader" do
    expect(@board).to be_a Board
    expect(@board.cells).to be_a Hash
  end
end
