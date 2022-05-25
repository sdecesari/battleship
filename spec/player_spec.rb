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
  it "can add more ships" do
    @player.add_ship(Ship.new('battleship', 5))

    expect(@player.ships[2].name).to eq('battleship')
    expect(@player.ships.length).to eq(3)
  end
end
