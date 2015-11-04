require "highline/import"  #Prompt user and get his/hers input

class Season_List

	attr_accessor :productsMarket
	def initialize
		@productsMarket={
			 :apples =>[10,10,15,12],
			 :oranges =>[5,2,5,5],
             :grapes =>[15,15,15,15],
             :banana => [20,20,20,21],
             :watermelon =>[50,50,50,50]

		}
	end

	def season_input
		picked_season=ask "Please enter the actual season to display product's prices:\nYou can type 'Spring', 'Summer', 'Autumn' and 'Winter':"
		picked_season.chomp.downcase
		
	      productsMarket.each do |key| 

		      case picked_season
				when "spring"
				   puts productsMarket[key][0]
				when "summer"
					puts productsMarket[key][1]
				when "autumn"
				    productsMarket[key][2]
				when "winter"
					productsMarket[3]
				else
				  puts "Thats not a valid season. Try again"
				  season_input
				end
		    end
		   productsMarket
	end

	def isSunday?(productsMarket)
		isSunday=ask "Today is Sunday?:\n Please answer 'Yes' or 'No'"
		 case isSunday
		 	when "yes"
		 		productsMarket[:watermelon]=100  #Watermelon's price is doubled on sunday
				
		    when "no"
		    	productsMarket[:watermelon]=50   
			else
				puts "Thats not the espected answer."
			end
		productsMarket
	end
end

class ShoppingCart 

	attr_accessor :productsMarket, :list_products

	def initialize(product_list)

	    @productsMarket=product_list
	    @list_products={}
    end
	
	def add_item_to_cart product_id      #Add the cost of the selected products
		
		
		list_products[product_id]=productsMarket[product_id]
	end

	#Show shopping cart list
	def show
		puts "\nShopping list: "
        list_products.each {|key, val| print key, " ", val, "$\n"}     
	end
  
    #Calculate the total cost of shopping cart
    def cost 
        sum=0
    	list_products.each {|key,val| sum+= val}
    		puts "\nTotal cost: #{sum}$"
    end
end  


list_season=Season_List.new
prodList=list_season.season_input
list_week=list_season.isSunday?(prodList)
cart = ShoppingCart.new(list_week)
cart.add_item_to_cart :apples
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :watermelon
cart.show
cart.cost

