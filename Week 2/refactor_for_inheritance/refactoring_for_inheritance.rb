# class Car
#     @@WHEELS = 4
#     def initialize(args)
#         @color = args[:color]
#         @wheels = @@WHEELS
#     end
#     def drive
#         @status = :driving
#     end
#     def brake
#         @status = :stopped
#     end
#     def needs_gas?
#         return [true,true,false].sample
#     end
# end

# class Bus
#     attr_reader :passengers
#     def initialize(args)
#         @color = args[:color]
#         @wheels = args[:wheels]
#         @num_seats = args[:num_seats]
#         @fare = args[:fare]
#         @passengers=[]
#     end
#     def drive
#         return self.brake if stop_requested?
#         @status = :driving
#     end
#     def admit_passenger(passenger,money)
#         @passengers << passenger if money > @fare
#     end
#     def brake
#         @status = :stopped
#     end
#     def stop_requested?
#         return [true,false].sample
#     end
#     def needs_gas?
#         return [true,true,true,false].sample
#     end
# end

# class Motorbike
#     @@WHEELS = 2
#     def initialize(args)
#         @color = args[:color]
#         @wheels = @@WHEELS
#     end

#     def drive
#         @status = :driving
#         @speed = :fast
#     end

#     def brake
#         @status = :stopped
#     end
#     def needs_gas?
#         return [true,false,false,false].sample
#     end
#     def weave_through_traffic
#         @status = :driving_like_a_crazy_person
#     end
# end

#---------------------------------------------------------------
# Refactor for Inheritance
#---------------------------------------------------------------
class Vehicle

  def initialize(args)
    @color = args[:color]
    @wheels = args[:wheels]
  end

  def drive
    @status = :driving
  end

  def brake
    @status = :stopped
  end

end

class Car < Vehicle

  def initialize(args)
    @color = args[:color]
    @wheels = args[:wheels]
  end

  def needs_gas?
    return [true,true,false].sample
  end

end

class Bus < Vehicle
  attr_reader :passengers

  def initialize(args)
    @color = args[:color]
    @wheels = args[:wheels]
    @num_seats = args[:num_seats]
    @fare = args[:fare]
    @passengers=[]
  end

  def drive
    super
    return self.brake if stop_requested?
  end

  def admit_passenger(passenger,money)
    @passengers << passenger if money > @fare
  end

  def stop_requested?
    return [true,false].sample
  end

  def needs_gas?
    return [true,true,true,false].sample
  end

end

class Motorbike < Vehicle

  def initialize(args)
    @color = args[:color]
    @wheels = args[:wheels]
  end

  def drive
    super
    @speed = :fast
  end

  def needs_gas?
    return [true,false,false,false].sample
  end

  def weave_through_traffic
    @status = :driving_like_a_crazy_person
  end

end
