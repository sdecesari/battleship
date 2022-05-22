require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/battleship'
require './lib/computer'
require 'pry'

describe Computer do
  it "initializes" do
    computer = Computer.new

    expect(computer).to be_a Computer
  end
end
