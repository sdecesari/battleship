require './lib/ship'

RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "exists and has attributes" do
    expect(@cruiser).to be_a Ship
    expect(@cruiser.name).to eq "Cruiser"
    expect(@cruiser.length).to eq 3
  end

  it "returns health" do
    expect(@cruiser.health).to eq 3
  end

  it "checks if ship has sunk" do
    expect(@cruiser.sunk?).to eq false
  end

  it "can take a hit and check health" do
    @cruiser.hit
    expect(@cruiser.health).to eq 2
    @cruiser.hit
    expect(@cruiser.health).to eq 1
  end

  it "can check if ship sunk after a hit" do
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to eq false
    @cruiser.hit
    expect(@cruiser.sunk?).to eq true
  end
end
