#Load the YMAL library
require "yaml/store"

class Room 
	attr_accessor :exit,:tools,:inventory
	def initialize(description,exit,tools)
		@description=description
		@exit=exit
		@tools=tools
		
	end

	def print_message
		puts @description
	end

end

class Game
	attr_accessor :rooms
	def initialize
		@rooms=[]
		@current_room = 0
		@inventory=[]
	end

	def done 
		@current_room == @rooms.length	
	end

	def add_rooms(room)
		@rooms.push(room)
	end

	def move_rooms
		current_room += 1
	end	

	def pick_tools(tool)
		@inventory.push(tool)
	end

	 def save_file
	 	@array=["hello","goodbye","hi"]
	 	#If file accountinfo.yml doesn't exist
	 	# Create a new file with that name
    	unless File.exists?("accountinfo.yml")
      		File.new("accountinfo.yml", "w+")
    	end
    	f = File.open( 'accountinfo.yml', 'w' )
			YAML.dump( "The user tools are: #{@array.inspect}", f )
		f.close
  	 end


	def play
		user_input = ""
		
		while user_input.downcase != @rooms[@current_room].exit.downcase
			# system "clear" 
			@rooms[@current_room].print_message
			
			if @rooms[@current_room].tools=="no_objects"
				puts "Exits: #{@rooms[@current_room].exit}"
			else
				puts "Type '#{@rooms[@current_room].tools}' to added to your inventory or"
				puts "Exits: #{@rooms[@current_room].exit}"

			end
			
			user_input = gets.chomp

		    if user_input.downcase==@rooms[@current_room].tools.downcase
			 		pick_tools(user_input)
			 		puts "You picked a #{user_input}"
			 		#Changed to "no_objects" in order to ask the second time only 
			 		#to type the exit.
			 		@rooms[@current_room].tools="no_objects"
			end
	    end
		@current_room += 1

		#Execute the method 'play' while done is false(while current room is not
		#in the last one(Recursive method)
	   	play if !done
	end

	def print_inventory

	    user_input=""
		while user_input!='exit'
			puts "Type 'inventory' to go print the list of tools or type 'exit' "
			user_input=gets.chomp.downcase
			if user_input=='inventory'
				@inventory.each do |tool|
				puts tool
			    end
			end
		end
	end
end


room1=Room.new("You are in a dark room. There is a door to the North.","N","no_objects")
room2=Room.new("You are in a room of light. There is a door to the South.There is a sword on the floor","S","Sword")
room3=Room.new("You are in the forest. There is a hammer on the floor","S","hammer")
room4=Room.new("This is the last room. The exit is by the SW.","S","no objects")
game=Game.new
game.add_rooms(room1)
game.add_rooms(room2)
game.add_rooms(room3)

user_input=""
game.save_file
game.play


game_store = YAML::Store.new('./games.yaml')
game_store.transaction do 
game_store["josh_game"] = game
end

#If player is in the last room. Print a message after user types the exit.
if game.done
	puts "Good, You finished the game."
	game.print_inventory
end


# game.rooms.each do |room|
	
# 	while user_input.capitalize != room.exit
# 		room.print_message
# 		user_input=gets.chomp
# 	end
# 	# puts "Outside"
# end


