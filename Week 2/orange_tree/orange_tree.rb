# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end
 
class OrangeTree
  attr_reader :age, :height, :oranges_in_tree

  def initialize
    @height = 1
    @age = 0
    @oranges_in_tree = []
  end

  # Ages the tree one year
  def age!
    @age += 1 if @age < 20
    @height += 1 if @height < 15
    grow_orange
  end
 
  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    true if @oranges_in_tree.length > 0
  end
 
  def grow_orange
    bunch = 1+rand(5)
    bunch.times do
      @oranges_in_tree << Orange.new(3+rand(3)) if @age >= 5
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    @oranges_in_tree.pop 
  end

  def dead?
    true if @age >= 20
  end
end
 
class Orange
  attr_reader :diameter
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter)
    @diameter = diameter
  end

  def self.diameter
    @diameter
  end

end

tree = OrangeTree.new
tree.age!

tree.age! until tree.any_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  # It places the oranges in the basket
  # IT PLACES THE ORANGES IN THE BASKET
  while tree.any_oranges?
    basket << tree.pick_an_orange!
  end

  total = 0
  basket.each do |orange|
    total += orange.diameter
  end

  avg_diameter =  (total.to_f / basket.length)

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"
