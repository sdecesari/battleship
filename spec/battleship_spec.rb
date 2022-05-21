require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/battleship'
require 'pry'

RSpec.describe Battleship do
  before :each do
    @battleship = Battleship.new
  end
    it "exists" do
    expect(@battleship).to be_a Battleship
  end
end
