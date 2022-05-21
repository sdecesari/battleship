require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/battleship'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before :each do
    @board = Board.new
    @player = Player.new(@board)
  end

  it "exists" do
    expect(@player).to be_a Player
  end

  it "has ships" do
    expect(@player.cruiser).to be_a Ship
    expect(@player.submarine).to be_a Ship
  end
end
