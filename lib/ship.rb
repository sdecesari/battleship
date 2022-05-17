class Ship
  attr_reader :name,
              :health
  def initialize(name, health)
    @name = name
    @health = health
  end

  def length
    @health
  end
end
