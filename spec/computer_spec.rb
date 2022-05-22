require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/battleship'
require './lib/computer'
require 'pry'

describe Computer do
  before :each do
    @computer = Computer.new
  end
  it "initializes" do
    expect(@computer).to be_a Computer
  end
  it "has ships" do
    expect(@computer.cruiser).to be_a Ship
    expect(@computer.submarine).to be_a Ship
  end
end
