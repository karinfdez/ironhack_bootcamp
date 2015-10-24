require "highline/import"  #Prompt user and get his/hers input
require 'pry'
class Gamerunner 
	
	def initialize(array_of_rooms)
		@game = Game.new(array_of_rooms)
		@array_of_rooms = array_of_rooms
	end

	def run_game
		until @game.end_of_room?
			@game.start_playing

			# first Game is over
			if @game.class == Game && @game.end_of_room?
				special_room = Space.new("Great, you made it.This is the last room. To find the exit\n you should answer the next question:", "george washington")
				@game = SurpriseGame.new([ special_room ])
			end
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
		    input=ask "Please type N,S,W or E"
		    input=input.chomp.downcase	
		    break if(input==room_exit)  
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
	    print_message_screen
	end

	def print_message_screen
		puts "Congratulations. You won the Game!"
	end
end


description_room1= "You are on an empty room.There is a door at the North"
room1=Space.new(description_room1,"n")
description_room2="This room doesn't have lights. Be careful!.Move now to East"
room2=Space.new(description_room2,"e")
description_room3="The forest room!!!. Enjoy the stay.Why you don't move to the West?"
room3=Space.new(description_room3,"w")
description_room4="Lion's room.Watch out!!!.Run now to the South"
room4=Space.new(description_room4,"s")

array_rooms=[ room1,room2,room3,room4 ]
game_of_rooms=Gamerunner.new(array_rooms)
game_of_rooms.run_game


