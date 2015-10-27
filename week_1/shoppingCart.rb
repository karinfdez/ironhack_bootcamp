require "highline/import"  #Prompt user and get his/hers input

class Season_List

	attr_accessor :productsMarket
	def initialize
		@productsMarket={
			 apples: 10,
			 oranges: 5,
             grapes: 15,
             banana: 20,
             watermelon: 50

		}
	end

	def season_input
		picked_season=ask "Please enter the actual season to display product's prices:\nYou can type 'Spring', 'Summer', 'Autumn' and 'Winter':"
		picked_season.chomp.downcase
		
	      case picked_season
			when "spring"
				productsMarket
			when "summer"
				    productsMarket[:oranges]=2
			when "autumn"
			 productsMarket[:apples]=15
			when "winter"
				productsMarket[:apples]=12
				productsMarket[:banana]=21
			else
			  puts "Thats not a valid season. Try again"
			  season_input
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

	attr_accessor :productsMarket

	def initialize(product_list)

	    @productsMarket=product_list
	    @list_products={}
	    @costItems=[]
    end
	
	def add_item_to_cart product_id      #Add the cost of the selected products
		@costItems.push(@productsMarket[product_id])
	   
	   if @list_products.has_key?(product_id)
	   	@list_products[product_id]=@list_products[product_id]+1  #Add some values to item
	   
	   else
		@list_products[product_id]=1   #Add 1 value to item
	   end
	end

	#Show shopping cart list
	def show
		
		#Show total items and prices
		puts "\nShopping list: "
        @list_products.each {|key, val| print val, " ", key, " ",productsMarket[key], "$\n"}     
	end
  
    #Calculate the total cost of shopping cart
    def cost 

    	total=@costItems.reduce(0) do |sum,hm|
    		sum+=hm   
         end
    puts total
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

