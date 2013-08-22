# Solution for Challenge: Orange Tree 2: Groves!. Started 2013-05-21T00:40:03+00:00

class NoFruitError < StandardError
end


class FruitTree

  attr_reader :age, :height, :fruit_in_tree

  def initialize
    @height = 0
    @age = 0
    @fruit_in_tree = []
  end

  def age!
    add_age
    grow
  end

  def add_age
    @age += 1
  end

  def grow
    @height += @grow_rate
  end

  def any_fruit?
    @fruit_in_tree.any?
  end

  def grow_fruit
    (@age ** 2) * rand(30).times do
      @fruit_in_tree << Fruit.new(3) if @age >= @fruit_bearing_age
    end
  end

  def pick_fruit!
    raise NoFruitError, "This tree has no fruit" unless self.any_fruit?
    @fruit_in_tree.pop
  end

  def dead?
    @age >= @death
  end

end

class AppleTree < FruitTree
  def initialize
    super
    @death = 25
    @fruit_bearing_age = 5
    @grow_rate = 2
  end
end

class PeachTree < FruitTree
  def initialize
    super
    @death = 30
    @fruit_bearing_age = 3
    @grow_rate = 3
  end
end

class OrangeTree < FruitTree
  def initialize
    super
    @death = 15
    @fruit_bearing_age = 4
    @grow_rate = 1
  end
end



