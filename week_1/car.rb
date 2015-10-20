class Car
	
	def initialize(sound)
		
		@sound=sound
	end

	def noise
		puts "#{@sound}!!"
	end
end

# my_car=Car.new("broom")
# # puts my_car.inspect
# my_car.noise
# other_car=Car.new("BROOM")
# # puts other_car.inspect
# other_car.noise


# class Car
	
# 	attr_accessor :cities
# 	def initialize
# 		@cities= []
# 	end

# 	def visited_cities(my_city)
# 		cities.push(my_city)     #I don't use the @ because of the accessor.
# 	end
# end

# my_car=Car.new
# my_car.visited_cities("Rome")
# my_car.visited_cities("Madrid")
# puts my_car.inspect

class RacingCar< Car
	
	def initialize
		# @cities=[]
	end

	def noise
		puts "VROMMMM!!!"
		
	end

end

car=Car.new("BROOOM")
car.noise
other_car=RacingCar.new
other_car.noise
		
