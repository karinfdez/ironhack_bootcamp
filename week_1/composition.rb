class Car
  def initialize(engine)
    @engine = engine
  end

  def start
    @engine.ignite
  end
end

class Engine
  def move_pistons
    "Pshhhhh"
  end

  def ignite
    move_pistons
  end
end


class ElectricEngine < Engine
  def ignite
    "..."
  end
end



engine = ElectricEngine.new
electric_car = Car.new(engine)

puts electric_car.start


old_engine = Engine.new
car = Car.new(old_engine)

puts car.start
