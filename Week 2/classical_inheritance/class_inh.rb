module SuperPowers
  def laser_eyes
    p "I keeel you with my Laser Eyes!"
  end

  def hulk_smash
    p "SMASH! SMASH!"
  end

  def flash
    p "Running at lighting speed!"
  end
end

class Animal
  attr_reader :num_legs, :blood_type

  def initialize
    @num_legs = 4
    @blood_type = nil
  end

  def warm_blooded?
    @blood_type == 'warm'
  end
end

class Mammal < Animal

  attr_reader :wings

  def initialize
    super
    @blood_type = 'warm'
    @wings = false
  end

  def has_wings?
    @wings
  end

end

class Bat < Mammal
  
  include SuperPowers

  def initialize
    super
    @num_legs = 2
    @blood_type = 'warm'
    @wings = true
  end
end


class Amphibian < Animal
  def initialize
    super
    @blood_type = 'cold'
  end
end

class Frog < Amphibian
  def initialize
    super
    @blood_type = 'cold'
  end
end

class Primate < Mammal
  def initialize
    super
    @num_legs = 2
  end
end

class Chimpanzee < Primate
  def initialize
    @num_legs = 2
  end
end
