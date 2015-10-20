class Spaceship
  # attr_accessor(:worlds_visited)

  def initialize(size, max_speed, weight)
    @size = size

    # max speed in "warps"
    @max_speed = max_speed

    # weight in "tons"
    @weight = weight

    @worlds_visited = []
  end

  def fly
    puts "Taking off. You are airborne."
    puts "Flying at #{@max_speed} warps."
  end

  def land(world)
    puts "Landing now!"
    puts "Get ready for all of my #{@weight} tons."

    # log that it visited that world
    @worlds_visited.push(world)
  end

  def worlds_visited
    @worlds_visited
  end
end




enterprise = Spaceship.new("large", 100, 50)
# Spacing in the prints
puts "\n\n"

enterprise.fly


# Spacing in the prints
puts "\n\n"
enterprise.land("Mars")

puts "Worlds Visited:"
puts enterprise.worlds_visited.inspect

puts "\n\n"
enterprise.fly
enterprise.land("Earth")

puts "Worlds Visited:"
puts enterprise.worlds_visited.inspect


# Information
#-------------
# size
# max speed
# weight

# color
# material
# year_designed
# date_built
# defense (number)
# weapons = ANOTHER CLASS
# engines = ANOTHER CLASS


# Behavior
#---------
# fly
# land

# transports people
# jettison parts
# fire weapons
