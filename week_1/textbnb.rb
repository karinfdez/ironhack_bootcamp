
class Homes
	attr_reader(:name, :city, :capacity, :price)
	
	def initialize(name, city, capacity,price)
		@name=name
		@city=city
		@price=price
		@capacity=capacity
	end
end
	homes=[ Homes.new("Nizar's place", "San Juan", 2, 42),
 		  Homes.new("Fernando's place", "Seville", 4, 47),
		  Homes.new("Josh's place", "Pittsburgh", 3, 41),
		  Homes.new("Gonzalo's place", "Málaga", 2, 45),
		  Homes.new("Ariel's place", "San Juan", 4, 49),
		  Homes.new("Karin's place","Havana",6,50),
		  Homes.new("Alan's place","San Jose",1,30),	
		  Homes.new("Milla's place","Brazilia",5,45),	
		  Homes.new("Marilyn's place","Bogota",3,45), 
		  Homes.new("Mirta's place","Havana",2,28)
		]
	

		 # Iteration #1: List of homes
		 # homes.each do |hm|    each doesn't return anything.
		 # 		p hm.name
		 # end

		 # Iteration #2: Sorting
		 # default
		 # sorted=homes.sort do |home1,home2|
		 # 	home1.price<=>home2.price
		 # end
		 # p sorted
		  

		 def my_user(homes)   #Pass the variable homes inside the method. If I don't do it like that 
		 					 #is going to consider homes as a local variable.
		
			 
			 puts "Please enter which option to sort(price or capacity)"
			 user_input=gets.chomp
			

			 if user_input=="capacity"
			 	sorted_homes = homes.sort do |home1,home2|
			 	home2.capacity<=>home1.capacity  #sorting in descending order
			 	
			end
			p sorted_homes
				
			elsif user_input=="price"
				sorted_prices=homes.sort do |home1,home2|
			 	home2.price<=>home1.price
			 	
			end
			 p sorted_prices
			else
				my_user()

			 end
			 # p sorted_homes

		end

		# my_user(homes)

		# Iteration #3: Filter by city

		def user_city(homes)

			
			puts "Please enter the city you would like to find the home's average: "
			user_input=gets.chomp
			user_input=user_input.downcase

			city_homes=homes.select do |hm|
				hm.city.downcase==user_input
			end
			# p city_homes
		end

		 # user_city(homes)


		# Iteration #4: Average
		def average_homes(homes)

			city_homes=user_city(homes)   #returns the objects that have the same city name

			sum_prices= city_homes.reduce(0.0) do |sum, hm|
				  sum + hm.price
			end
			the_city = city_homes[0].city   #Gives me the first city(they are the same in this array)
			average=sum_prices/city_homes.length
			p "The average home price on #{the_city} city is: #{average}"
		end
		
		# average_homes(homes)

		# Iteration #5: Name your own price

		def your_price(homes)
			puts "Please enter a price to find a home for you: "
			user_input=gets.chomp
			user_input=user_input.to_i
			# p user_input
		
			user_pick=homes.find do |hm|
					hm.price==user_input
				end
				if user_pick.nil?    #if the user input doesn't correspond with the values stored
					puts "Sorry, there is not match with that home's price. Try again:"
					your_price(homes)
			    else
			    	p user_pick
			    end
			
			
		end
				# if(hm.price!=user_input)
				# 	puts "Sorry, there is not match with that price. Try again:"
				# 	your_price(homes)
		
			
		your_price(homes)
