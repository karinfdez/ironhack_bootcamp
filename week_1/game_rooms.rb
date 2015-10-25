require "highline/import"  #Prompt user and get his/hers input
require 'pry'
class Gamerunner 
	
	# attr_reader :location
	def initialize(array_of_rooms)
		@game = Game.new(array_of_rooms)
		@array_of_rooms = array_of_rooms 
        
	end

	def run_game
		until @game.end_of_room?
			
			# objectLocation=@game.instance_variable_get(:@location)  #Why I can't get it with the accessor?
			@game.start_playing
		end

			# first Game is over
		if @game.class == Game && @game.end_of_room?
			question_room = Space.new("Great, this is the room of questions.To find the exit\n you should answer the next question:", "george washington")
			object_room=Space.new("Before leaving, I want to give you 1 gift.Please type 'gift'.", "gift")
			@game = SurpriseGame.new([question_room])
			@game.message_user
			@game.prompt_user
			@game=GameObjects.new([object_room])
			@game.prompt_user
			@game=GiftObject.new([object_room])
			@game.message_user    #How can have acces to the message on object room?. I need @location for that.
			@game.prompt_user
		end
    end
end

class Space
	attr_accessor :description_room, :exit
	
	def initialize(description_room,exit)
		# @exit_coordinate=entrance_coordinate
		@exit=exit
		@description_room=description_room
	end
	
	def exit?(user_exit)    #tell me which direction exit is
      @exit == user_exit
    end
end

class Game
	
	def initialize (array)   #variable hold the array of rooms
		@location=0
		@array=array


	end

    def message_user	
    	puts @array[@location].description_room 	
    end

    def prompt_user
	  	   
	    loop do
			room_exit= @array[@location].exit
		    input=ask "Exit is: #{room_exit}"
		    input=input.chomp.downcase	
		    break if(input==room_exit.downcase)  
	    end
    end

    def end_of_room?
    	@location==@array.length
     end

    def move_other_room
    	@location+=1
    end

    def start_playing
		message_user
		prompt_user
		move_other_room	    
    end
end

class SurpriseGame <Game


	def prompt_user
		exit = @array[@location].exit

	    loop do
		    input=ask "Who was the USA's first president:'Ronald Reagan', 'George Washington' or 'Richard Nixon'."
		    input=input.chomp.downcase	
		    if input !="george washington"
		    	puts "Incorrect answer. Try again."
		    end
		    break if(input==exit)
	    end
	end

	def print_message_screen
		puts "Congratulations. You won the Game!"
	end
end

class GameObjects <SurpriseGame

	def initialize(array)
		super
		@arrayObjects=[]
	end

	def pickObjects(object)
		@arrayObjects.push(object)
	end

	def prompt_user
		exit = "pick up book"
		exit_split=exit.split(" ")
		user_object=exit_split[2]

	    loop do
		    input=ask "Before leaving to the next room.Type 'pick up book' to read it."
		    input=input.chomp.downcase	
		    if input !=exit
		    	puts "Incorrect action. Try again."
		    end
		    break if(input==exit)
	    end

	    pickObjects(user_object)
	    print_message_screen(user_object)
	end
	def print_message_screen(user_pick)
		puts "Good job!. Now the #{user_pick} is safe with you"
	end

	def inventory
		puts "List of objects:"
		@arrayObjects.each do |hm|
			puts hm
	    end
	end
end

class GiftObject <GameObjects

	
	def prompt_user
		exit = @array[@location].exit
		exit_split=exit.split(" ")
		user_object=exit_split[1]

	    loop do
		    input=ask "Type 'gift' to take gift."
		    input=input.chomp.downcase	
		    if input !=exit
		    	puts "Incorrect action. Try again."
		    end
		    break if(input==exit)
	    end
	    pickObjects(user_object)
	    print_message_screen(user_object)
	end
	def print_message_screen(user_pick)
		answer_user=ask "Congratulations. You won the game.To see what items you are taking home,type 'inventory'"
		if answer_user.downcase=="inventory"
		     inventory
		else
			print_message_screen(user_pick)
	    end
	end

end

description_room1= "You are on an empty room.There is a door:"
room1=Space.new(description_room1,"N")
description_room2="This room doesn't have lights. Be careful!.Move now to the next room"
room2=Space.new(description_room2,"E")
description_room3="The forest room!!!. Enjoy the stay.Why you don't move to the next one?."
room3=Space.new(description_room3,"W")
array_rooms=[ room1,room2,room3 ]
game_of_rooms=Gamerunner.new(array_rooms)
game_of_rooms.run_game


