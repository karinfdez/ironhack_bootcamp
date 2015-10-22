require "highline/import"  #Prompt user and get his/hers input

class Correct_input

	attr_accessor :system_password, :system_username, :user_input
	
	def initialize(system_username,system_password)
		@system_password=system_password
		@system_username=system_username
		@user_input=""

	end

	def prompt(user_decision)
		user_input= ask "Please enter #{user_decision} > "
		user_input=user_input.downcase
	end

	def correct_input?(user_input, password_input)
		
		if user_input==system_username && password_input==system_password
			true
		else
			false
        end
    end
 end

class Length_input
	attr_accessor :word
	
	def initialize(word)
		@word=word
	end	

	def long_words
		if word   #if method correct_input? is true
			user= ask "Correct, now give some text"
			user=user.downcase
		    array_words=user.split(" ")   #Creates array of each words
			puts "You type " + array_words.length.to_s + " words"
	    else
	    	puts "Incorrect username or password.Try again"
	    end
    end
end

myUser=Correct_input.new("karinfpe3","ironhack2015")
user_name= myUser.prompt("username")
password =myUser.prompt("password")
correct=myUser.correct_input?(user_name,password)
length_word=Length_input.new(correct)
length_word.long_words


  



  

