# # Answer These Questions:

# # - What are essential classes?

# Cookies, Oven & Baker

# # - What attributes will each class have?

# Oven: Temperature
      
# Cookie: Cooking Time
#         Batch Size
#         Cooking Temperature

# # - What interface will each class provide?

# Cookie: Done?
#         Status?

# Oven: Cookies_In_Oven?


# # - How will the classes interact with each other?

# Oven will contain a collection of cookies?


# # - Which classes will inherit from others, if any?

# Types of Cookies (e.g. Peanut Butter, etc) will be able to inherit from base cookie class.

# # Your code here

class Baker
  def turn_on_oven(oven)
    oven.switch = true
  end

  def put_batch_in_oven(oven)
    oven.loaded = true
  end

  def timer?(oven)
    oven.timer
  end

  def check_product?(oven, product)
    return :doughy if doughy(oven, product)    
    return :almost_ready if almost_ready(oven, product)
    return :done if done(oven, product)
    return :burned if burned(oven, product)
  end

  def doughy(oven, product)
    oven.timer < (product.cooking_time - 4)
  end

  def almost_ready(oven, product)
    oven.timer < (product.cooking_time) && !doughy(oven, product)
  end

  def done(oven, product)
    oven.timer == product.cooking_time
  end

  def burned(oven, product)
    oven.timer > product.cooking_time
  end

  def pull_out_batch(oven, product)
    "#{product.batch_size} #{product.class} cookies are done!"
  end

  def set_temperature(oven, value)
    if oven.switch  
      oven.temperature = value 
    else
      "Turn on the oven, please!"
    end
  end

end

class Cookie
  attr_reader :cooking_time, :batch_size, :cooking_temp

end

class Chocolate_Chip < Cookie

  def initialize
    @cooking_time = 12
    @batch_size = 24
    @cooking_temp = 350
  end

end

class Peanut_Butter < Cookie

  def initialize
    @cooking_time = 10
    @batch_size = 36
    @cooking_temp = 400
  end

end

class Oven

  attr_accessor :temperature, :timer, :switch, :loaded
  
  def initialize
    @switch = false
    @temperature = 0
    @timer = 0
    @loaded = false
  end 

  def is_empty?
    @loaded
  end

  def baking(product)
    if temperature >= product.cooking_temp
      @timer += 1
    end
  end
end

#----------------------------------------------------------------------
maytag = Oven.new
kenmore = Oven.new
flay = Baker.new
choc = Chocolate_Chip.new
nutter_butter = Peanut_Butter.new

flay.turn_on_oven(maytag)
flay.set_temperature(maytag, choc.cooking_temp)
flay.put_batch_in_oven(maytag)
until flay.check_product?(maytag, choc) == :done
  p "Cookie status: #{flay.check_product?(maytag, choc)}"
  maytag.baking(choc)
end
p flay.pull_out_batch(maytag, choc)

flay.turn_on_oven(kenmore)
flay.set_temperature(kenmore, nutter_butter.cooking_temp)
flay.put_batch_in_oven(kenmore)
until flay.check_product?(kenmore, nutter_butter) == :done
  p "Cookie status: #{flay.check_product?(kenmore, nutter_butter)}"
  kenmore.baking(nutter_butter)
end
p flay.pull_out_batch(kenmore, nutter_butter)

