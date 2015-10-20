class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end


homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 4, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

# Using the map:

# prices=homes.map do |hm|
# 	hm.price
# end

# sum=0.0
# prices.each do |hm|
# 	sum+=hm
# end
# average=sum/prices.length
# puts average

# iterating inside the homes array: 

# sum_prices= homes.reduce(0.0) do |sum, hm|
#   sum + hm.price
# end
# average=sum_prices/homes.length

# puts average

# homes.each_with_index do |hm, index|
#   puts "Home Number #{index + 1}: #{hm.name}"
# end

# Homes with capacity 4 or more
# high_capacity_homes = homes.select do |hm|
#   # Keep hm only if its capacity is 4 or greater
#    puts hm.capacity >= 4
# end
	
# Homes in San Juan
# san_juan_homes = homes.select do |hm|
#   # Keep hm only if its city is "San Juan"
#   hm.city == "San Juan"
# end
# print san_juan_homes

# homes with low capacity
# low_capacity=homes.select do |hm|
# 	hm.capacity>=4
# end
# print low_capacity

# Using find
# home_41_dollars=homes.find do |hm|
# 	hm.capacity>=2
# end

# p home_41_dollars


# Sort
# sorted = homes.sort do |home1, home2|
#   # Compare the two homes by their capacity
#   home1.capacity <=> home2.capacity
# end
# # If I do p sorted I get an array of objects with the capacity sorted.

# sorted.each do |hm|
# 	p hm.capacity
# end


# Range of values:
# rng = 1..42

# rng.each do |number|
#   puts "The next number in the range is: #{number}"
# end

# double = rng.map do |number|
#   number * 2
# end

# puts double

