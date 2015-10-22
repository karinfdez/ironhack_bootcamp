class ATV
	attr_accessor :sound, :wheels

	def initialize(sound)
		@sund=sound
		@wheels=4
	end		
end

class MiCarro
	attr_accessor :sound, :wheels
	def initialize(sound)
		@sound=sound
		@wheels=3
	end
end

class Mercedes
	attr_accessor :sound, :wheels
	def initialize(sound)

		@sound=sound
		@wheels=6
	end

end

class WheelCounter
	def initialize(vehicles)
		@vehicles=vehicles
	end

	def count
		# return the total number of wheels in @vehicles
		@vehicles.reduce(0.0) do |sum,hm|
			sum+=hm.wheels
		end
	end
end

class SoundPrinter
	def initialize(vehicles)
		@vehicles=vehicles
	end

	def print
		# Print all the sound in @vehicles
		@vehicles.each do |hm|
			puts hm.sound
	    end
    end
 end

atv=ATV.new("Vrrm Vrrm")
atv2=ATV.new("brrm brrm")
micarro=MiCarro.new("shh shh shh")
mirtica=Mercedes.new("como sueno!!!!")
vehicle_array=[atv,atv2,micarro,mirtica]
counter=WheelCounter.new(vehicle_array)
puts counter.count
print=SoundPrinter.new(vehicle_array)
print.print