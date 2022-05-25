require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/battleship'
require './lib/player'

RSpec.describe Player do
  before :each do
    @board = Board.new(4)
    @player = Player.new(@board)
  end

  it "exists" do
    expect(@player).to be_a Player
  end

  it "has ships" do
    expect(@player.ships[0]).to be_a Ship
    expect(@player.ships[1]).to be_a Ship
    expect(@player.ships.length).to eq(2)
  end
end
